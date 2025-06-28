part of 'transactions_page.dart';

class _TransactionsList extends StatelessWidget {
  const _TransactionsList(this.transactions);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    final total = transactions.fold<double>(0, (sum, t) => sum + t.amount);

    return Column(
      children: [
        DefaultHeaderListTile(
          key: ValueKey(total),
          leading: Text('Всего'),
          trailing: Text('${total.toString()} ₽'),
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
                // Return spacing container for last "item"
                // (Also, helps creating last divider)
                return const SizedBox(height: 16);
              }

              final transaction = transactions[index];
              return DefaultListTile(
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

