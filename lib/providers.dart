import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yndx_homework/data/repositories/mock_transactions_repository.dart';
import 'package:yndx_homework/domain/models/transaction.dart';
import 'package:yndx_homework/domain/repositories/transactions_repository.dart';

final transactionRepositoryProvider = Provider<ITransactionsRepository>(
  (_) => MockTransactionsRepository(),
);

final transactionForTodayProvider =
    FutureProvider.family<List<Transaction>, bool>((ref, isIncome) async {
      final repo = ref.watch(transactionRepositoryProvider);

      final now = DateTime.now();
      final startOfDay = DateTime(now.year, now.month, now.day);
      final endOfDay = startOfDay
          .add(const Duration(days: 1))
          .subtract(const Duration(milliseconds: 1));

      // final operations = await repo.getTransactionsForPeriod(
      //   startOfDay,
      //   endOfDay,
      // );

      final operations = await repo.getTransactions();

      return operations.where((op) => op.category.isIncome == isIncome).toList();
    });
