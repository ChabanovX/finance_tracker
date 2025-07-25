import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yndx_homework/features/transactions/domain/models/category.dart';
import 'package:yndx_homework/features/transactions/domain/models/transaction.dart';
import 'package:yndx_homework/shared/providers/repository_providers.dart';
import 'package:yndx_homework/util/log.dart';

part 'providers.g.dart';

enum SortByEnum { date, amount }

class DateRange {
  DateRange(this.start, this.end);

  final DateTime start;
  final DateTime end;
}

@riverpod
class SortBy extends _$SortBy {
  @override
  SortByEnum build() {
    return SortByEnum.date;
  }

  void set(SortByEnum e) => state = e;
}

@Riverpod(dependencies: [])
bool isIncome(Ref ref) {
  throw UnimplementedError();
}

@riverpod
Future<List<Category>> category(Ref ref) async {
  final repo = ref.watch(categoriesRepositoryProvider);
  return repo.getAllCategories();
}

@Riverpod(dependencies: [isIncome, TransactionsForPeriod])
Future<double> totalAmount(Ref ref) async {
  final isIncome = ref.watch(isIncomeProvider);
  final range = ref.watch(transactionsRangeProvider(isIncome));
  final txs = await ref.watch(
    transactionsForPeriodProvider(range.start, range.end).future,
  );

  return txs.fold<double>(0.0, (sum, t) => sum + t.amount);
}

/// Used in analysis.
@Riverpod(dependencies: [isIncome, TransactionsForPeriod])
Future<Map<Category, List<Transaction>>> transactionsByCategory(Ref ref) async {
  final isIncome = ref.watch(isIncomeProvider);
  final range = ref.watch(transactionsRangeProvider(isIncome));

  final List<Transaction> txs = await ref.watch(
    transactionsForPeriodProvider(range.start, range.end).future,
  );

  final map = <Category, List<Transaction>>{};
  for (final t in txs) {
    map.putIfAbsent(t.category, () => []).add(t);
  }
  return map;
}

/// Used in history.
@Riverpod(dependencies: [isIncome, TransactionsForPeriod])
Future<List<Transaction>> sortedTransactions(Ref ref) async {
  final sortBy = ref.watch(sortByProvider);
  final isIncome = ref.watch(isIncomeProvider);
  final range = ref.watch(transactionsRangeProvider(isIncome));

  final List<Transaction> unsortedTxs = await ref.watch(
    transactionsForPeriodProvider(range.start, range.end).future,
  );

  final copy = [...unsortedTxs];
  switch (sortBy) {
    case SortByEnum.amount:
      copy.sort((a, b) => b.amount.compareTo(a.amount));
      break;
    case SortByEnum.date:
      copy.sort((a, b) => b.transactionDate.compareTo(a.transactionDate));
  }
  return copy;
}

@riverpod
class TransactionsRange extends _$TransactionsRange {
  @override
  DateRange build(bool isIncome) {
    final now = DateTime.now();
    return DateRange(
      DateTime(now.year, now.month - 1, now.day),
      DateTime(now.year, now.month, now.day),
    );
  }

  void updateStart(DateTime newStart) {
    if (state.end.isBefore(newStart)) {
      state = DateRange(newStart, newStart);
      return;
    }
    state = DateRange(newStart, state.end);
  }

  void updateEnd(DateTime newEnd) {
    if (state.start.isAfter(newEnd)) {
      state = DateRange(newEnd, newEnd);
      return;
    }
    state = DateRange(state.start, newEnd);
  }

  void update(DateTime start, DateTime end) => state = DateRange(start, end);
}

@Riverpod(dependencies: [isIncome])
class TransactionsForPeriod extends _$TransactionsForPeriod {
  /// Returns a list of daily transactions.
  @override
  Future<List<Transaction>> build(DateTime start, DateTime end) async {
    final isIncome = ref.watch(isIncomeProvider);
    final repo = ref.watch(transactionsRepositoryProvider);

    // final accountId = (await ref.watch(accountProvider.future)).id;

    // final list = await repo.getTransactionsForPeriod(start, end, accountId);
    final list = await repo.getTransactions();
    Log.info('$runtimeType($start, $end): $list');
    return list.where((e) => e.category.isIncome == isIncome).toList();
  }
}
