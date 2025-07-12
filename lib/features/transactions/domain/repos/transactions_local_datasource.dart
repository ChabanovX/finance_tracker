import 'package:yndx_homework/features/transactions/domain/models/transaction.dart';

abstract interface class ITransactionsLocalDataSource {
  Future<List<Transaction>> getTransactions();
  Future<List<Transaction>> getTransactionsForPeriod(DateTime start, DateTime end);
  Future<void> addTransaction(Transaction transaction);
  Future<void> saveTransactions(List<Transaction> transactions);
  Future<void> updateTransaction(Transaction transaction);
  Future<void> deleteTransaction(int transactionId);
  Future<void> clearTransactions();
}
