import '/data/datasources/local/mappers.dart';
import '/data/datasources/local/objectbox.dart';
import '/data/datasources/local/objectbox.g.dart';
import '/data/models/local/transaction_entity.dart';
import '/domain/models/transaction.dart';
import '/domain/repositories/transactions_repository.dart';

class TransactionsObjectBoxRepository implements ITransactionsRepository {
  final ObjectBox _ob;

  TransactionsObjectBoxRepository(this._ob);

  Transaction _map(TransactionEntity entity) {
    final account = _ob.accountBox.get(entity.account.targetId)!;
    final category = _ob.categoryBox.get(entity.category.targetId)!;
    return entity.toDomain(account, category);
  }

  @override
  Future<void> addTransaction(Transaction transaction) async {
    _ob.transactionBox.put(transaction.toEntity());
  }

  @override
  Future<void> deleteTransaction(int transactionId) async {
    _ob.transactionBox.remove(transactionId);
  }

  @override
  Future<List<Transaction>> getTransactions() async {
    return _ob.transactionBox.getAll().map(_map).toList();
  }

  @override
  Future<List<Transaction>> getTransactionsForPeriod(
    DateTime start,
    DateTime end,
  ) async {
    final query = _ob.transactionBox.query(
      TransactionEntity_.transactionDate.between(
        start.millisecondsSinceEpoch,
        end.millisecondsSinceEpoch,
      ),
    ).build();
    final result = query.find();
    query.close();

    return result.map(_map).toList();
  }

  @override
  Future<void> updateTransaction(Transaction transaction) async {
    _ob.transactionBox.put(transaction.toEntity());
  }
}
