import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/domain/models/transaction.dart';
import '/presentation/providers.dart';
import '/presentation/shared/default_app_bar.dart';
import '/presentation/shared/default_header_list_tile.dart';
import '/presentation/shared/default_list_tile.dart';
import '../transactions_history_page/transactions_history_page.dart';
import '/presentation/theme/app_theme.dart';

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
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => ProviderScope(
                        overrides: [
                          isIncomeProvider.overrideWithValue(isIncome),
                        ],
                        child: TransactionsHistoryPage(isIncome: isIncome),
                      ),
                ),
              );
            },
            icon: Icon(Icons.history),
            iconSize: 24,
            padding: EdgeInsets.all(12),
          ),
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
