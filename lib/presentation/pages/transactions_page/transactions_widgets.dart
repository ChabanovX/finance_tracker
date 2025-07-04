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
                          // Simply pass it without DI.
                          isIncome: transaction.category.isIncome,
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

class _EditTransactionModal extends ConsumerStatefulWidget {
  const _EditTransactionModal({
    super.key,
    required this.transaction,
    required this.isIncome,
  });

  final Transaction transaction;
  final bool isIncome;

  @override
  ConsumerState<_EditTransactionModal> createState() =>
      _EditTransactionModalState();
}

class _EditTransactionModalState extends ConsumerState<_EditTransactionModal> {
  late TextEditingController _amountCtrl;
  late TextEditingController _commentCtrl;

  Category? _category;
  Account? _account;

  @override
  void initState() {
    super.initState();
    _amountCtrl = TextEditingController(
      text: widget.transaction.amount.toString(),
    );
    _commentCtrl = TextEditingController(text: widget.transaction.comment);
    _category = widget.transaction.category;
    _account = widget.transaction.account;
  }

  @override
  void dispose() {
    _amountCtrl.dispose();
    _commentCtrl.dispose();
    super.dispose();
  }

  /// Parses entered data and saves via riverpod.
  Future<void> _save() async {
    final amount =
        double.tryParse(_amountCtrl.text.replaceAll(',', '.')) ??
        widget.transaction.amount;

    final updated = widget.transaction.copyWith(
      amount: amount,
      comment: _commentCtrl.text.isEmpty ? null : _commentCtrl.text,
      category: _category ?? widget.transaction.category,
      account: _account ?? widget.transaction.account,
    );

    // Save and update state.
    final repo = ref.read(transactionRepositoryProvider);
    await repo.updateTransaction(updated);
    ref.invalidate(transactionsProvider);
    ref.invalidate(transactionForTodayProvider);

    // Leave safely.
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  /// THIS LOOKS AWFUL.
  Widget _buildAccountRef() => ref
      .watch(accountProvider)
      .when(
        data:
            (acc) => DropdownButtonFormField<Account>(
              value: _account ?? acc,
              items:
                  [acc]
                      .map(
                        (a) => DropdownMenuItem(value: a, child: Text(a.name)),
                      )
                      .toList(),
              onChanged: (a) => setState(() => _account = a),
              decoration: const InputDecoration(labelText: 'Account'),
            ),
        loading: () => const CircularProgressIndicator(),
        error: (e, _) => Text('Error: $e'),
      );

  /// THIS LOOKS AWFUL too.
  Widget _buildCategoryRef() => ref
      .watch(categoriesProvider)
      .when(
        data:
            (cats) => DropdownButtonFormField(
              value: _category,
              items:
                  cats
                      .map(
                        (cat) =>
                            DropdownMenuItem(value: cat, child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(cat.name),
                                Text(cat.emoji),
                              ],
                            )),
                      )
                      .toList(),
              onChanged:
                  (c) => setState(() {
                    _category = c;
                  }),
              decoration: const InputDecoration(labelText: 'Category'),
            ),
        error: (err, _) => Center(child: Text(err.toString())),
        loading: () => const CircularProgressIndicator(),
      );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Edit Transaction'),
              const SizedBox(height: 12),
              TextField(
                controller: _amountCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Amount'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _commentCtrl,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'Commentary'),
              ),
              const SizedBox(height: 8),
              _buildCategoryRef(),
              const SizedBox(height: 8),
              _buildAccountRef(),
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
