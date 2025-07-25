import '../../domain/models/transaction.dart';

abstract interface class ITransactionsRemoteDataSource {
  Future<List<Transaction>> getTransactions();
  Future<List<Transaction>> getTransactionsForPeriod(
    DateTime start,
    DateTime end,
    int accountId,
  );
  Future<Transaction> createTransaction(Transaction transaction);
  Future<Transaction> updateTransaction(Transaction transaction);
  Future<void> deleteTransaction(int transactionId);
}

