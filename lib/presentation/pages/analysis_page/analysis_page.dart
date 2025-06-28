import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yndx_homework/domain/models/category.dart';
import 'package:yndx_homework/presentation/shared/default_list_tile.dart';
import 'package:yndx_homework/presentation/theme/app_theme.dart';

import '/domain/models/transaction.dart';
import '/presentation/providers.dart';
import '/presentation/shared/default_app_bar.dart';
import '/presentation/shared/default_header_list_tile.dart';

part 'analysis_widgets.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            DefaultHeaderListTile(
              backgroundColor: bg,
              leading: Text('Период: начало'),
              trailing: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: context.colors.accent,
                  shape: const StadiumBorder(),
                  elevation: 0,
                ),
                onPressed: () {},
                child: Text('март 2025'),
              ),
            ),
            Divider(height: 1),
            DefaultHeaderListTile(
              backgroundColor: bg,
              leading: Text('Период: конец'),
              trailing: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: context.colors.accent,
                  shape: const StadiumBorder(),
                  elevation: 0,
                ),
                onPressed: () {},
                child: Text('март 2025'),
              ),
            ),
            Divider(height: 1),
            DefaultHeaderListTile(
              backgroundColor: bg,
              leading: Text('Сумма'),
              trailing: Text('123123 ₽'),
            ),
            Divider(height: 1),
            SizedBox(
              height: 200,
              child: Padding(padding: EdgeInsets.all(24), child: Placeholder()),
            ),
            Divider(height: 1),
            // And build listView of those
            DefaultListTile(transaction: transaction, isFirstInList: isFirstInList),
          ],
        ),
      ),
    );
  }
}