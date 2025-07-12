part of 'transactions_page.dart';

@Dependencies([Transactions])
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
                        return _TransactionModal(
                          // Simply pass it without DI.
                          isIncome: transaction.category.isIncome,
                          initial: transaction,
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

@Dependencies([Transactions])
class _TransactionModal extends ConsumerStatefulWidget {
  const _TransactionModal({
    super.key,
    required this.initial,
    required this.isIncome,
  });

  /// [null] == add mode.
  final Transaction? initial;
  final bool isIncome;

  @override
  ConsumerState<_TransactionModal> createState() => _TransactionModalState();
}

class _TransactionModalState extends ConsumerState<_TransactionModal> {
  late final bool isEditing = widget.initial != null;

  /// Stored date (today by default).
  late DateTime _date = DateTime.now();

  late final _amountCtrl = TextEditingController(
    text: widget.initial?.amount.toString() ?? '',
  );
  late final _commentCtrl = TextEditingController(
    text: widget.initial?.comment ?? '',
  );

  Category? _category;
  Account? _account;

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _date) {
      setState(() => _date = picked);
    }
  }

  @override
  void initState() {
    super.initState();
    _category = widget.initial?.category;
    _account = widget.initial?.account;

    // fetch selected [Account].
    if (!isEditing && _account == null) {
      Future.microtask(() async {
        final acc = await ref.read(accountProvider.future);
        if (mounted && _account == null) {
          setState(() => _account = acc);
        }
      });
    }
  }

  @override
  void dispose() {
    _amountCtrl.dispose();
    _commentCtrl.dispose();
    super.dispose();
  }

  /// Parses entered data and saves via riverpod.
  Future<void> _save() async {
    final repo = ref.read(transactionsRepositoryProvider);

    // Parse and Sign-Check
    final raw = double.tryParse(_amountCtrl.text.replaceAll(',', '.'));
    if (raw == null) {
      _snack('Введите сумму'); // “enter amount”
      return;
    }
    final wrongSign = widget.isIncome ? raw < 0 : raw > 0;
    if (wrongSign) {
      _snack(
        widget.isIncome
            ? 'Доход должен быть положительным'
            : 'Расход должен быть отрицательным',
      );
      return;
    }

    if (_category == null) {
      _snack('Выберите Категорию');
      return;
    }

    if (_account == null) {
      _snack('Выберите аккаунт');
      return;
    }

    final category = ((_category ?? widget.initial!.category).copyWith(
      isIncome: widget.isIncome,
    ));

    // Build a [Transaction] copy or a new one.
    final tx =
        isEditing
            ? widget.initial!.copyWith(
              amount: raw,
              comment: _commentCtrl.text.isEmpty ? null : _commentCtrl.text,
              category: category,
              account: _account ?? widget.initial!.account,
            )
            : Transaction(
              // Id is handled inside repository.
              // To be changed to `int?`
              id: 0,
              amount: raw,
              comment: _commentCtrl.text.isEmpty ? null : _commentCtrl.text,
              category: category,
              account: _account!,
              transactionDate: _date,
            );

    // Save and update state.
    if (isEditing) {
      await repo.updateTransaction(tx);
    } else {
      await repo.addTransaction(tx);
    }

    // Refresh UI and close.
    ref.invalidate(transactionsProvider);
    ref.invalidate(transactionsProvider);
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  void _snack(String msg) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

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
      .watch(categoryProvider)
      .when(
        data:
            (cats) => DropdownButtonFormField(
              value: _category,
              items:
                  cats
                      .map(
                        (cat) => DropdownMenuItem(
                          value: cat,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text(cat.name), Text(cat.emoji)],
                          ),
                        ),
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
    final locale = Localizations.localeOf(context);
    final title = isEditing ? 'Edit Transaction' : 'New Transaction';

    return Center(
      child: Material(
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title),
              const SizedBox(height: 12),
              TextField(
                controller: _amountCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Amount'),
                inputFormatters: [DecimalTextInputFormatter(locale)],
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _commentCtrl,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'Commentary'),
              ),
              const SizedBox(height: 8),
              if (!isEditing) ...[
                GestureDetector(
                  onTap: _pickDate,
                  child: InputDecorator(
                    decoration: const InputDecoration(labelText: 'Date'),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(DateFormat.yMMMd().format(_date)),
                        const Icon(Icons.calendar_today_outlined, size: 20),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
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

/// Allows only digits and **one** locale-aware decimal separator.
class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter(Locale locale)
    : _sep =
          NumberFormat.decimalPattern(
            locale.toString(),
          ).symbols.DECIMAL_SEP; // "." for en, "," for ru, etc.

  final String _sep;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Regex: optional leading sign, digits, optional (separator + digits)
    final pattern = '^\\-?\\d*(${RegExp.escape(_sep)}\\d*)?\$';
    final reg = RegExp(pattern);

    final text = newValue.text;

    // Block: anything that…
    final bool isInvalid =
        !reg.hasMatch(text) || // …doesn’t match pattern
        text.indexOf(_sep) != text.lastIndexOf(_sep); // …contains >1 separator

    return isInvalid ? oldValue : newValue;
  }
}
