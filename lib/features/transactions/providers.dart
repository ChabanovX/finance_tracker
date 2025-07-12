import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yndx_homework/features/balance/providers.dart';
import 'package:yndx_homework/features/transactions/domain/models/category.dart';
import 'package:yndx_homework/features/transactions/domain/models/transaction.dart';
import 'package:yndx_homework/shared/providers/repository_providers.dart';

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

@Riverpod(dependencies: [isIncome, sortedTransactions])
double totalAmount(Ref ref) {
  final isIncome = ref.watch(isIncomeProvider);
  return ref
      .watch(sortedTransactionsProvider(isIncome))
      .fold(0.0, (sum, t) => sum + t.amount);
}

@Riverpod(dependencies: [Transactions])
Map<Category, List<Transaction>> txByCategory(Ref ref) {
  final List<Transaction> list = ref.watch(transactionsProvider).value ?? [];

  final map = <Category, List<Transaction>>{};
  for (final t in list) {
    map.putIfAbsent(t.category, () => []).add(t);
  }
  return map;
}

@Riverpod(dependencies: [Transactions])
List<Transaction> sortedTransactions(Ref ref, bool isIncome) {
  final sortBy = ref.watch(sortByProvider);
  final List<Transaction> list = ref.watch(transactionsProvider).value ?? [];

  final copy = [...list];
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
class TxRange extends _$TxRange {
  @override
  DateRange build(bool isIncome) {
    final now = DateTime.now();
    return DateRange(
      DateTime(now.year, now.month - 1, now.day),
      DateTime(now.year, now.month, now.day),
    );
  }

  void updateStart(DateTime newStart) => state = DateRange(newStart, state.end);
  void updateEnd(DateTime newEnd) => state = DateRange(state.start, newEnd);

  void update(DateTime start, DateTime end) => state = DateRange(start, end);
}

@riverpod
class HistoryStart extends _$HistoryStart {
  @override
  DateTime build(bool isIncome) {
    final now = DateTime.now();
    return DateTime(now.year, now.month - 1, now.day);
  }

  void setDate(DateTime date) => state = date;
}

@riverpod
class HistoryEnd extends _$HistoryEnd {
  @override
  DateTime build(bool isIncome) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  void setDate(DateTime date) => state = date;
}

@Riverpod(dependencies: [isIncome])
class Transactions extends _$Transactions {
  /// Returns a list of daily transactions.
  @override
  Future<List<Transaction>> build() async {
    final isIncome = ref.watch(isIncomeProvider);
    final repo = ref.watch(transactionsRepositoryProvider);
    final range = ref.watch(txRangeProvider(isIncome));

    final start = DateTime(
      range.start.year,
      range.start.month,
      range.start.day,
    );
    final end = DateTime(
      range.start.year,
      range.start.month,
      range.start.day + 1,
    ).subtract(const Duration(microseconds: 1));

    final accountId = (await ref.watch(accountProvider.future)).id;

    final list = await repo.getTransactionsForPeriod(start, end, accountId);
    return list.where((e) => e.category.isIncome == isIncome).toList();
  }
}
