import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yndx_homework/domain/models/transaction.dart';
import 'package:yndx_homework/presentation/shared/default_app_bar.dart';
import 'package:yndx_homework/presentation/theme/app_theme.dart';
import 'package:yndx_homework/providers.dart';

class TransactionsPage extends ConsumerWidget {
  const TransactionsPage({super.key, required this.isIncome});

  /// Indicates whether [TransactionsPage] is about expenses or incomes
  final bool isIncome;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsAsync = ref.watch(transactionForTodayProvider(isIncome));

    return transactionsAsync.when(
      data:
          (transactions) => Scaffold(
            appBar: DefaultAppBar(
              title: isIncome ? 'Доходы сегодня' : 'Расходы сегодня',
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.history),
                  iconSize: 24,
                ),
              ],
            ),
            body: _TransactionsList(transactions),
            floatingActionButton: FloatingActionButton(
              shape: const CircleBorder(),
              child: Icon(
                Icons.add_rounded,
                color: context.colors.white,
                size: 15.56 * 2,
              ),
              onPressed: () {},
            ),
          ),
      error: (e, _) => Center(child: Text('error: ${e.toString()}')),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}

class _DefaultListTile extends StatelessWidget {
  const _DefaultListTile({
    required this.transaction,
    required this.isFirstInList,
    super.key,
  });

  final Transaction transaction;

  /// Indicates
  final bool isFirstInList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isFirstInList ? 68 : 69,
      child: Row(
        children: [
          SizedBox(width: 16),
          Text(transaction.category.emoji),
          SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(transaction.category.name),
                  if (transaction.comment != null) Text(transaction.comment!),
                ],
              ),
            ),
          ),
          SizedBox(width: 16),
          Text('${transaction.amount.toString()} ₽'),
          SizedBox(width: 16),
          Icon(Icons.chevron_right_rounded),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}

class _HeaderListTile extends StatelessWidget {
  const _HeaderListTile({
    super.key,
    required this.leftText,
    required this.rightText,
  });

  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.accentLight,
      height: 56,
      child: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(leftText), Text(rightText)],
        ),
      ),
    );
  }
}

class _TransactionsList extends StatelessWidget {
  const _TransactionsList(this.transactions);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    final total = transactions.fold<double>(0, (sum, t) => sum + t.amount);

    return Column(
      children: [
        _HeaderListTile(
          key: ValueKey(total),
          leftText: 'Всего',
          rightText: '${total.toString()} ₽',
        ),
        const Divider(height: 1),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemCount:
                transactions.length +
                1, // +1 for empty item that adds final divider
            itemBuilder: (ctx, index) {
              if (index == transactions.length) {
                // Return empty container for last "item" - separator will create final divider
                return const SizedBox.shrink();
              }

              final transaction = transactions[index];
              return _DefaultListTile(
                isFirstInList: index == 0,
                transaction: transaction,
                key: ObjectKey(transaction),
              );
            },
          ),
        ),
      ],
    );
  }
}
