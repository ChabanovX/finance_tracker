part of 'transactions_page.dart';

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
          // TODO: use Account's currency in future
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
                // Return spacing container for last "item"
                // (Also, helps creating last divider)
                return const SizedBox(height: 16);
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

class _DefaultListTile extends StatelessWidget {
  const _DefaultListTile({
    required this.transaction,
    required this.isFirstInList,
    super.key,
  });

  /// [Transaction] object
  final Transaction transaction;

  /// Indicates whether [_DefaultListTile] is first in List
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
          Icon(Icons.chevron_right_rounded, color: context.colors.inactive.withAlpha((0.3 * 255).toInt())),
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
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(leftText), Text(rightText)],
        ),
      ),
    );
  }
}
