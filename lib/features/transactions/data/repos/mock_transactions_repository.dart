// ignore_for_file: avoid_print

import 'package:yndx_homework/shared/data/datasources/mock_data.dart';
import 'package:yndx_homework/features/transactions/domain/models/transaction.dart';
import 'package:yndx_homework/features/transactions/domain/repos/transactions_repository.dart';
import 'package:yndx_homework/util/log.dart';

class MockTransactionsRepository implements ITransactionsRepository {
  /// Duration of fake async call.
  static const _ioDuration = Duration(milliseconds: 250);

  @override
  Future<List<Transaction>> getTransactions() async {
    await Future.delayed(_ioDuration);
    return mockTransactions;
  }

  @override
  Future<List<Transaction>> getTransactionsForPeriod(
    DateTime start,
    DateTime end,
    int accountId,
  ) async {
    await Future.delayed(_ioDuration);
    return mockTransactions
        .where(
          // Inclusive Boundaries
          (t) =>
              !t.transactionDate.isBefore(start) &&
              !t.transactionDate.isAfter(end),
        )
        .toList();
  }

  @override
  Future<void> updateTransaction(Transaction transaction) async {
    await Future.delayed(_ioDuration);
    final index = mockTransactions.indexWhere((t) => t.id == transaction.id);
    if (index != -1) {
      mockTransactions[index] = transaction;
      // Log.info('Transaction updated: ${transaction.id}');
    }
  }

  @override
  Future<void> addTransaction(Transaction transaction) async {
    await Future.delayed(_ioDuration);
    // Create transaction with unique ID
    final newTransaction = transaction.copyWith(
      id: DateTime.now().millisecondsSinceEpoch,
    );
    mockTransactions.add(newTransaction);
    print('Transaction added: ${newTransaction.id}');
  }

  @override
  Future<void> deleteTransaction(int transactionId) async {
    final index = mockTransactions.indexWhere((t) => t.id == transactionId);
    if (index != -1) {
      mockTransactions.removeAt(index);
    }
    print('Transaction removed: $transactionId');
  }
}
