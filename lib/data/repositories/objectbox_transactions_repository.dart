import 'package:yndx_homework/core/log.dart';

import '/data/datasources/local/mappers.dart';
import '/data/datasources/local/objectbox.dart';
import '/data/datasources/local/objectbox.g.dart';
import '/data/models/local/transaction_entity.dart';
import '/domain/models/transaction.dart';
import '/domain/repositories/transactions_repository.dart';

class TransactionsObjectBoxRepository implements ITransactionsRepository {
  final ObjectBox _ob;

  TransactionsObjectBoxRepository(this._ob);

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
      Log.error('Missing link on transaction id=${e.id}');
      return null;
    }

    Log.debug('✅ Successfully added $e');
    return e.toDomain(a, c);
  }

  @override
  Future<List<Transaction>> getTransactions() async {
    final transactionEntities = _ob.transactionBox.getAll();
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
    final result = query.find();
    query.close();

    return result.map(_map).toList();
  }

  @override
  Future<void> addTransaction(Transaction transaction) async {
    final acc = _ob.accountBox.get(transaction.account.id);
    final cat = _ob.categoryBox.get(transaction.category.id);
    if (acc == null || cat == null) {
      throw StateError('Parent row missing when adding transaction');
    }

    _ob.transactionBox.put(transaction.toEntity(acc, cat));
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
}
