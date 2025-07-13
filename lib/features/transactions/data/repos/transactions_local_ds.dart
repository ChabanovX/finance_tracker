import 'package:yndx_homework/features/account/data/models/local/account_entity.dart';
import 'package:yndx_homework/features/transactions/data/models/local/category_entity.dart';
import 'package:yndx_homework/features/transactions/domain/repos/transactions_local_datasource.dart';
import 'package:yndx_homework/util/log.dart';

import '../../../../shared/data/datasources/local/mappers.dart';
import '../../../../shared/data/datasources/local/objectbox.dart';
import '../../../../shared/data/datasources/local/objectbox.g.dart';
import '../models/local/transaction_entity.dart';
import '../../domain/models/transaction.dart';

class TransactionsLocalDatasource implements ITransactionsLocalDataSource {
  final ObjectBox _ob;

  TransactionsLocalDatasource(this._ob);

  /// Crushes if something goes wrong.
  Transaction _map(TransactionEntity entity) {
    final accountEntity = _ob.accountBox.get(entity.account.targetId);
    final categoryEntity = _ob.categoryBox.get(entity.category.targetId);

    if (accountEntity == null || categoryEntity == null) {
      // Data is corrupt.
      throw StateError('Dangling link in transactions: ${entity.id}');
    }

    return entity.toDomain(accountEntity, categoryEntity);
  }

  /// Gracefully logs if fails.
  Transaction? _tryMap(TransactionEntity e) {
    final a = e.account.target;
    final c = e.category.target;

    if (a == null || c == null) {
      Log.error('Missing link on transaction id=${e.id}: $runtimeType');
      return null;
    }

    Log.debug('✅ Successfully added $e');
    return e.toDomain(a, c);
  }

  @override
  Future<List<Transaction>> getTransactions() async {
    final transactionEntities = _ob.transactionBox.getAll();
    Log.info('local txs: $transactionEntities');
    return transactionEntities.map(_tryMap).whereType<Transaction>().toList();
  }

  @override
  Future<List<Transaction>> getTransactionsForPeriod(
    DateTime start,
    DateTime end,
  ) async {
    final query =
        _ob.transactionBox
            .query(
              TransactionEntity_.transactionDate.between(
                start.millisecondsSinceEpoch,
                end.millisecondsSinceEpoch,
              ),
            )
            .build();
    try {
      final list = query.find().map(_map).toList();
      Log.info('$runtimeType($start, $end) $list');
      return list;
    } finally {
      query.close();
    }
  }

  @override
  Future<void> addTransaction(Transaction transaction) async {
    final acc = transaction.account.toEntity();
    final cat = transaction.category.toEntity();

    _ob.transactionBox.put(transaction.toEntity(acc, cat));
    Log.info('addTransaction($transaction): $runtimeType');
  }

  @override
  Future<void> updateTransaction(Transaction transaction) async {
    final existing = _ob.transactionBox.get(transaction.id);
    if (existing == null) return; // might throw in future

    final acc = _ob.accountBox.get(transaction.account.id);
    final cat = _ob.categoryBox.get(transaction.category.id);

    if (acc == null || cat == null) {
      throw StateError('Parent row is missing in $runtimeType');
    }

    existing
      ..amount = transaction.amount
      ..transactionDate = transaction.transactionDate
      ..comment = transaction.comment
      ..account.target = acc
      ..category.target = cat;

    _ob.transactionBox.put(existing);
  }

  @override
  Future<void> deleteTransaction(int transactionId) async {
    _ob.transactionBox.remove(transactionId);
  }

  @override
  Future<void> clearTransactions() async {
    _ob.transactionBox.removeAll();
  }

  @override
  Future<void> saveTransactions(List<Transaction> transactions) async {
    _ob.store.runInTransaction(TxMode.write, () {
      final accountCache = <int, AccountEntity>{};
      final categoryCache = <int, CategoryEntity>{};

      final entities = <TransactionEntity>[];

      for (final t in transactions) {
        final accId = t.account.id;
        final accEntity = accountCache.putIfAbsent(
          accId,
          () => t.account.toEntity(),
        );
        _ob.accountBox.put(accEntity);

        final catId = t.category.id;
        final catEntity = categoryCache.putIfAbsent(
          catId,
          () => t.category.toEntity(),
        );
        _ob.categoryBox.put(catEntity);

        entities.add(t.toEntity(accEntity, catEntity));
      }

      _ob.transactionBox.putMany(entities);
    });
  }
}
