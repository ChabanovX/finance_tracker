import 'package:yndx_homework/core/network/backup_manager.dart';
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
  Future<void> syncOperations(List<BackupOperation> operations);
}

