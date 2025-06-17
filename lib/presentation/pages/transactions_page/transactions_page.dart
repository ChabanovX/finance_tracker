import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yndx_homework/domain/models/transaction.dart';
import 'package:yndx_homework/presentation/shared/default_app_bar.dart';
import 'package:yndx_homework/presentation/theme/app_theme.dart';
import 'package:yndx_homework/providers.dart';

part 'transactions_loading_widgets.dart';
part 'transactions_widgets.dart';

class TransactionsPage extends ConsumerWidget {
  const TransactionsPage({super.key, required this.isIncome});

  /// Indicates whether [TransactionsPage] is about expenses or incomes
  final bool isIncome;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsAsync = ref.watch(transactionForTodayProvider(isIncome));

    return Scaffold(
      appBar: DefaultAppBar(
        title: isIncome ? 'Доходы сегодня' : 'Расходы сегодня',
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.history), iconSize: 24),
        ],
      ),
      body: transactionsAsync.when(
        data: (data) => _TransactionsList(data),
        loading: () => _LoadingTransactionsList(),
        error: (error, _) => Center(child: Text("Error occured: $error")),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        child: Icon(
          Icons.add_rounded,
          color: context.colors.white,
          size: 15.56 * 2,
        ),
        onPressed: () {},
      ),
    );
  }
}

