import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:yndx_homework/features/transactions/presentation/transactions_page/transactions_page.dart';
import 'package:yndx_homework/features/transactions/providers.dart';

import '../../domain/models/transaction.dart';
import '../../../../shared/presentation/widgets/default_list_tile.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/presentation/widgets/default_app_bar.dart';
import '../../../../shared/presentation/widgets/default_header_list_tile.dart';

part 'transactions_history_widgets.dart';

@Dependencies([totalAmount, TransactionsForPeriod, sortedTransactions])
class TransactionsHistoryPage extends ConsumerWidget {
  const TransactionsHistoryPage({
    super.key,
    required this.isIncome,
    required this.onShowAnalysis,
  });

  /// Indicates whether [TransactionsHistoryPage] is about expenses or incomes.
  final bool isIncome;

  final VoidCallback onShowAnalysis;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final range = ref.watch(transactionsRangeProvider(isIncome));

    final total = ref.watch(totalAmountProvider);
    final sortBy = ref.watch(sortByProvider);
    final asyncSorted = ref.watch(sortedTransactionsProvider);

    return Scaffold(
      appBar: DefaultAppBar(
        title: isIncome ? 'История доходов' : 'История расходов',
        actions: [
          asyncSorted.when(
            data:
                (data) =>
                    data.isNotEmpty
                        ? IconButton(
                          onPressed: onShowAnalysis,
                          padding: EdgeInsets.all(12),
                          icon: Icon(Icons.pending_actions, size: 24),
                        )
                        : SizedBox.shrink(),
            error: (_, __) => SizedBox.shrink(),
            loading: () => SizedBox.shrink(),
          ),
        ],
      ),
      body: Column(
        children: [
          _DateTile(
            label: 'Начало',
            date: range.start,
            onTap: () => _pickStart(context, ref, range.start),
          ),
          const Divider(height: 1),
          _DateTile(
            label: 'Конец',
            date: range.end,
            onTap: () => _pickEnd(context, ref, range.end),
          ),
          const Divider(height: 1),
          _SortTile(
            sortBy: sortBy,
            onChange: (s) => ref.read(sortByProvider.notifier).set(s),
          ),
          const Divider(height: 1),
          DefaultHeaderListTile(
            leading: Text('Сумма'),
            trailing: Text(total.isLoading ? 'Loading...' : '${total.value!} ₽'),
          ),
          Expanded(
            child: asyncSorted.when(
              data:
                  (data) =>
                      data.isNotEmpty ? _HistoryList(data) : Center(child: Text('Ничего не нашлось...'),),
              error: (_, __) => SizedBox.shrink(),
              loading:
                  () => Center(child: CircularProgressIndicator.adaptive()),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickStart(
    BuildContext context,
    WidgetRef ref,
    DateTime initial,
  ) async {
    final picked = await _showPicker(context, initial);
    if (picked != null) {
      ref
          .read(transactionsRangeProvider(isIncome).notifier)
          .updateStart(picked);
    }
  }

  Future<void> _pickEnd(
    BuildContext context,
    WidgetRef ref,
    DateTime initial,
  ) async {
    final picked = await _showPicker(context, initial);
    if (picked != null) {
      ref.read(transactionsRangeProvider(isIncome).notifier).updateEnd(picked);
    }
  }

  Future<DateTime?> _showPicker(BuildContext context, DateTime initial) {
    final now = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(now.year - 3),
      lastDate: DateTime(now.year + 3),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: context.colors.accent,
              onPrimary: context.colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: context.colors.accent,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
  }
}
