import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/data/repositories/mock_transactions_repository.dart';
import '/domain/models/transaction.dart';
import '/domain/repositories/transactions_repository.dart';

// Some day should replace with a real one
final transactionRepositoryProvider = Provider<ITransactionsRepository>(
  (_) => MockTransactionsRepository(),
);

enum SortBy { date, amount }

/// Direction of operations (income / expense) - injected from page.
///
/// Overrided via [ProviderScope]
final isIncomeProvider = Provider<bool>((_) => throw UnimplementedError());

/// Whether to sort by date or amount
final sortByProvider = StateProvider<SortBy>((_) => SortBy.date);

final historyStartProvider = StateProvider<DateTime>((_) {
  final now = DateTime.now();
  return DateTime(now.year, now.month - 1, now.day);
});

final historyEndProvider = StateProvider<DateTime>((_) {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day);
});

/// Safely update startTime.
void updateStartDate(WidgetRef ref, DateTime newStart) {
  final end = ref.read(historyEndProvider);
  ref.read(historyStartProvider.notifier).state = newStart;
  // Keeping range valid
  if (newStart.isAfter(end)) {
    ref.read(historyEndProvider.notifier).state = newStart;
  }
}

/// Safely update endTime.
void updateEndDate(WidgetRef ref, DateTime newEnd) {
  final start = ref.read(historyStartProvider);
  ref.read(historyEndProvider.notifier).state = newEnd;
  // Keeping range valid
  if (newEnd.isBefore(start)) {
    ref.read(historyStartProvider.notifier).state = newEnd;
  }
}

/// Update both start and end of history at once.
///
/// Method does not check ranging, considering UI checking that.
void updateRange(WidgetRef ref, DateTime start, DateTime end) {
  ref.read(historyStartProvider.notifier).state = start;
  ref.read(historyEndProvider.notifier).state = end;
}

/// Data loader (AsyncNotifier)
class TransactionsNotifier extends AsyncNotifier<List<Transaction>> {
  @override
  FutureOr<List<Transaction>> build() async {
    final repo = ref.watch(transactionRepositoryProvider);
    final start = ref.watch(historyStartProvider);
    final end = ref.watch(historyEndProvider);
    final isIncome = ref.watch(isIncomeProvider);

    final startOfDay = DateTime(start.year, start.month, start.day);
    final endOfDay = DateTime(
      end.year,
      end.month,
      end.day + 1,
    ).subtract(Duration(microseconds: 1));

    final ops = await repo.getTransactionsForPeriod(startOfDay, endOfDay);
    return ops.where((t) => t.category.isIncome == isIncome).toList();
  }
}

final transactionsProvider =
    AsyncNotifierProvider<TransactionsNotifier, List<Transaction>>(
      TransactionsNotifier.new,
      dependencies: [isIncomeProvider],
    );

// Derived data
final sortedTransactionsProvider = Provider<List<Transaction>>((ref) {
  ref.watch(isIncomeProvider);
  final list = ref.watch(transactionsProvider).valueOrNull ?? [];
  final sortBy = ref.watch(sortByProvider);

  final copy = [...list];
  switch (sortBy) {
    case SortBy.amount:
      copy.sort((a, b) => b.amount.compareTo(a.amount));
      break;
    case SortBy.date:
      copy.sort((a, b) => b.transactionDate.compareTo(a.transactionDate));
      break;
  }
  return copy;
}, dependencies: [isIncomeProvider, transactionsProvider, sortByProvider]);

final totalAmountProvider = Provider<double>((ref) {
  ref.watch(isIncomeProvider);
  return ref
      .watch(sortedTransactionsProvider)
      .fold(0, (sum, t) => sum + t.amount);
}, dependencies: [isIncomeProvider, sortedTransactionsProvider]);

/// Today's transactions shortcut
final transactionForTodayProvider = FutureProvider.family<
  List<Transaction>,
  bool
>((ref, isIncome) async {
  final repo = ref.watch(transactionRepositoryProvider);

  final now = DateTime.now();
  final startOfDay = DateTime(now.year, now.month, now.day);
  final endOfDay = startOfDay
      .add(const Duration(days: 1))
      .subtract(const Duration(milliseconds: 1));

  final operations = await repo.getTransactionsForPeriod(startOfDay, endOfDay);

  return operations.where((op) => op.category.isIncome == isIncome).toList();
});
