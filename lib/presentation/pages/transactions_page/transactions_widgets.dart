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
                onTap:
                    () => showGeneralDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: 'Edit Transaction',
                      pageBuilder: (ctx, an1, an2) {
                        return _EditTransactionModal(
                          transaction: transaction,
                          key: Key('_EditTransactionModal'),
                        );
                      },
                    ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _EditTransactionModal extends StatefulWidget {
  const _EditTransactionModal({super.key, required this.transaction});

  final Transaction transaction;

  @override
  State<_EditTransactionModal> createState() => _EditTransactionModalState();
}

class _EditTransactionModalState extends State<_EditTransactionModal> {
  late TextEditingController _amountCtrl;
  late TextEditingController _commentCtrl;
  late TextEditingController _categoryCtrl;

  @override
  void initState() {
    super.initState();
    _amountCtrl = TextEditingController(
      text: widget.transaction.amount.toString(),
    );
    _commentCtrl = TextEditingController(text: widget.transaction.comment);
    _categoryCtrl = TextEditingController(
      text: widget.transaction.category.toString(),
    );
  }

  @override
  void dispose() {
    _amountCtrl.dispose();
    _commentCtrl.dispose();
    _categoryCtrl.dispose();
    super.dispose();
  }

  void _save() {}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
          height: 300,
          child: Column(
            children: [
              Text('Edit Transaction'),
              const SizedBox(height: 12),
              TextField(
                controller: _amountCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Amount'),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () async {
                  final Category? picked = await showMenu<Category>(
                    context: context,
                    position: RelativeRect.fromLTRB(100, 200, 100, 0),
                    items:
                        [
                              Category(
                                id: 0,
                                name: 'Salary',
                                emoji: '🏦',
                                isIncome: true,
                              ),
                              Category(
                                id: 0,
                                name: 'Freelance',
                                emoji: '💻',
                                isIncome: true,
                              ),
                              Category(
                                id: 0,
                                name: 'Investments',
                                emoji: '📈',
                                isIncome: true,
                              ),
                            ]
                            .map(
                              (c) =>
                                  PopupMenuItem(value: c, child: Text(c.name)),
                            )
                            .toList(),
                  );
                  if (picked != null)
                    setState(() {});
                },
                child: InputDecorator(
                  decoration: const InputDecoration(labelText: 'Category'),
                  child: Text('Select…'),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(onPressed: _save, child: const Text('Save')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
