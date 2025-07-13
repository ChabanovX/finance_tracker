import 'package:animated_pie_chart/animated_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:yndx_homework/features/transactions/domain/models/category.dart';
import 'package:yndx_homework/features/transactions/presentation/transactions_page/transactions_page.dart';
import 'package:yndx_homework/features/transactions/providers.dart';
import 'package:yndx_homework/shared/presentation/widgets/default_list_tile.dart';
import 'package:yndx_homework/core/theme/app_theme.dart';

import '../../domain/models/transaction.dart';
import '../../../../shared/presentation/widgets/default_app_bar.dart';
import '../../../../shared/presentation/widgets/default_header_list_tile.dart';

part 'analysis_widgets.dart';

@Dependencies([
  totalAmount,
  transactionsByCategory,
  isIncome,
  TransactionsForPeriod,
])
class AnalysisPage extends ConsumerWidget {
  const AnalysisPage({super.key, required this.isIncome});

  final bool isIncome;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bg = Theme.of(context).colorScheme.surface;

    final txRange = ref.watch(transactionsRangeProvider(isIncome));

    final txsTotal = ref.watch(totalAmountProvider);
    final asyncTxsCategories = ref.watch(transactionsByCategoryProvider);

    return Scaffold(
      appBar: AppBar(backgroundColor: bg, title: Text('Анализ')),
      body: Column(
        children: [
          _DateTile(
            label: 'Период: начало',
            date: txRange.start,
            onTap: () => _pickStart(context, ref, txRange.start),
            backgroundColor: bg,
          ),
          Divider(height: 1),
          _DateTile(
            label: 'Период: конец',
            date: txRange.end,
            onTap: () => _pickEnd(context, ref, txRange.end),
            backgroundColor: bg,
          ),
          Divider(height: 1),
          DefaultHeaderListTile(
            backgroundColor: bg,
            leading: Text('Сумма'),
            trailing: Text(txsTotal.isLoading ? 'loading...' : '${txsTotal.value}₽'),
          ),
          Divider(height: 1),
          SizedBox(
            height: 200,
            child: Padding(
              padding: EdgeInsets.all(24),
              child: _AnalysisChart(key: Key('_AnalysisChart')),
            ),
          ),
          Divider(height: 1),
          // And build listView of those
          Expanded(
            child: asyncTxsCategories.when(
              data:
                  (data) => _CategoryList(
                    data.entries
                        .map((e) => _CategoryGroup(e.key, e.value))
                        .toList(),
                  ),
              error: (error, stackTrace) => Center(child: Text('Упc: $error')),
              loading: () => Center(child: CircularProgressIndicator.adaptive()),
            ),
          ),
        ],
      ),
    );
  }
}

@Dependencies([isIncome])
Future<void> _pickStart(
  BuildContext context,
  WidgetRef ref,
  DateTime initial,
) async {
  final picked = await _showPicker(context, initial);
  if (picked != null) {
    final isIncome = ref.watch(isIncomeProvider);
    ref.read(transactionsRangeProvider(isIncome).notifier).updateStart(picked);
  }
}

@Dependencies([isIncome])
Future<void> _pickEnd(
  BuildContext context,
  WidgetRef ref,
  DateTime initial,
) async {
  final picked = await _showPicker(context, initial);
  if (picked != null) {
    final isIncome = ref.watch(isIncomeProvider);
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
      return child!;
    },
  );
}
