import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yndx_homework/features/balance/providers.dart';
import 'package:yndx_homework/features/transactions/domain/models/category.dart';
import 'package:yndx_homework/features/transactions/domain/models/transaction.dart';
import 'package:yndx_homework/features/transactions/domain/models/transaction_view.dart';
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

@Riverpod(dependencies: [TransactionsForPeriod])
AsyncValue<TransactionView> transactionsView(
  Ref ref, {
  required bool isIncome,
  required DateTime start,
  required DateTime end,
}) {
  final sortBy = ref.watch(sortByProvider);

  final asyncTx = ref.watch(transactionsForPeriodProvider(start, end));

  return asyncTx.when(
    loading: () => AsyncLoading(),
    error: (error, stackTrace) => AsyncError(error, stackTrace),
    data: (txList) {
      // Sorted and cleared txs.
      final cleared =
          txList.where((tx) => tx.category.isIncome == isIncome).toList();
      switch (sortBy) {
        case (SortByEnum.amount):
          cleared.sort((a, b) => b.amount.compareTo(a.amount));
          break;
        default:
          cleared.sort(
            (a, b) => b.transactionDate.compareTo(a.transactionDate),
          );
          break;
      }

      // Total.
      final total = cleared.fold(0.0, (val, t) => val + t.amount);

      // Group by category.
      final byCat = <Category, List<Transaction>>{};
      for (final tx in cleared) {
        byCat.putIfAbsent(tx.category, () => []).add(tx);
      }

      return AsyncData(
        TransactionView(sorted: cleared, total: total, byCategory: byCat),
      );
    },
  );
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
class TransactionsForPeriod extends _$TransactionsForPeriod {
  /// Returns a list of daily transactions.
  @override
  Future<List<Transaction>> build(DateTime start, DateTime end) async {
    final isIncome = ref.watch(isIncomeProvider);
    final repo = ref.watch(transactionsRepositoryProvider);
    final accountId = (await ref.watch(accountProvider.future)).id;

    final list = await repo.getTransactionsForPeriod(start, end, accountId);
    Log.info('TransactionsForPeriod: $list');
    return list.where((e) => e.category.isIncome == isIncome).toList();
  }
}
