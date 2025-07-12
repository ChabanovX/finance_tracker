
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

@Dependencies([Transactions, totalAmount, isIncome, txByCategory])
class AnalysisPage extends ConsumerWidget {
  const AnalysisPage({super.key, required this.isIncome});

  final bool isIncome;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final start = ref.watch(historyStartProvider(isIncome));
    final end = ref.watch(historyEndProvider(isIncome));
    final transactionsAsync = ref.watch(transactionsProvider);
    final total = ref.watch(totalAmountProvider);
    final bg = Theme.of(context).colorScheme.surface;

    return Scaffold(
      appBar: AppBar(backgroundColor: bg, title: Text('Анализ')),
      body: Column(
        children: [
          _DateTile(
            label: 'Период: начало',
            date: start,
            onTap: () => _pickStart(context, ref, start),
            backgroundColor: bg,
          ),
          Divider(height: 1),
          _DateTile(
            label: 'Период: конец',
            date: end,
            onTap: () => _pickEnd(context, ref, end),
            backgroundColor: bg,
          ),
          Divider(height: 1),
          DefaultHeaderListTile(
            backgroundColor: bg,
            leading: Text('Сумма'),
            trailing: Text('$total₽'),
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
            child: transactionsAsync.when(
              data: (_) {
                final groups =
                    ref
                        .watch(txByCategoryProvider)
                        .entries
                        .map((e) => _CategoryGroup(e.key, e.value))
                        .toList();
                groups.sort((a, b) => b.total.compareTo(a.total));
                return _CategoryList(groups);
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(child: Text('Error occured: $err')),
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
    ref.read(txRangeProvider(isIncome).notifier).updateStart(picked);
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
    ref.read(txRangeProvider(isIncome).notifier).updateEnd(picked);
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
