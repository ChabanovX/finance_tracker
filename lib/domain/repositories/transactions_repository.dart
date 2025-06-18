import 'package:yndx_homework/domain/models/transaction.dart';

abstract interface class ITransactionsRepository {
  /// Fetches a list of all transactions.
  Future<List<Transaction>> getTransactions();

  /// Fetches transactions within provided range.
  Future<List<Transaction>> getTransactionsForPeriod(
    DateTime start,
    DateTime end,
  );

  /// Adds a new transaction.
  Future<void> addTransaction(Transaction transaction);

  /// Updates an existing transaction.
  Future<void> updateTransaction(Transaction transaction);

  /// Deletes a transaction by its ID.
  Future<void> deleteTransaction(int transactionId);
}
