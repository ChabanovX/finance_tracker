part of 'transactions_page.dart';

@Dependencies([TransactionsForPeriod])
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
                      useRootNavigator: false,
                      barrierLabel: 'Edit Transaction',
                      pageBuilder: (ctx, an1, an2) {
                        return TransactionModal(
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

@Dependencies([TransactionsForPeriod])
class TransactionModal extends ConsumerStatefulWidget {
  const TransactionModal({
    super.key,
    required this.initial,
    required this.isIncome,
  });

  /// [null] == add mode.
  final Transaction? initial;
  final bool isIncome;

  @override
  ConsumerState<TransactionModal> createState() => _TransactionModalState();
}

class _TransactionModalState extends ConsumerState<TransactionModal> {
  late final bool isEditing = widget.initial != null;

  /// Stored date (today by default).
  late DateTime _date = DateTime.now();

  late final _amountCtrl = TextEditingController(
    text: widget.initial?.amount.toString() ?? '',
  );
  late final _commentCtrl = TextEditingController(
    text: widget.initial?.comment ?? '',
  );

  late DateTime _dateTime = widget.initial?.transactionDate ?? DateTime.now();

  Category? _category;
  Account? _account;

  Future<void> _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate == null) return;

    if (!mounted) return;
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_dateTime),
    );

    final newDateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime?.hour ?? _dateTime.hour,
      pickedTime?.minute ?? _dateTime.minute,
    );

    if (mounted) setState(() => _dateTime = newDateTime);
  }

  @override
  void initState() {
    super.initState();
    _category = widget.initial?.category;
    _categoryId = widget.initial?.category.id;
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
    double? raw = double.tryParse(_amountCtrl.text.replaceAll(',', '.'));
    if (raw == null) {
      _snack('Введите сумму'); // “enter amount”
      return;
    }
    final wrongSign = widget.isIncome ? raw < 0 : raw > 0;
    if (wrongSign) raw = -raw;

    if (_categoryId == null) {
      _snack('Выберите Категорию');
      return;
    }

    if (_account == null) {
      _snack('Выберите аккаунт');
      return;
    }

    // Find the category by ID
    final allCats = await ref.read(categoryProvider.future);
    final category = allCats.firstWhere((cat) => cat.id == _categoryId);

    // Build a [Transaction] copy or a new one.
    final tx =
        isEditing
            ? widget.initial!.copyWith(
              amount: raw,
              transactionDate: _date,
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
    ref.invalidate(transactionsForPeriodProvider);
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  void _snack(String msg) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

  /// THIS LOOKS AWFUL.
  Widget _buildAccountRef() => ref
      .watch(accountProvider)
      .when(
        data: (acc) {
          if (_account == null || _account!.id == acc.id) {
            _account = acc;
          }
          return DropdownButtonFormField<Account>(
            value: acc,
            items:
                [acc]
                    .map((a) => DropdownMenuItem(value: a, child: Text(a.name)))
                    .toList(),
            onChanged: (a) => setState(() => _account = a),
            decoration: const InputDecoration(labelText: 'Account'),
          );
        },
        loading: () {
          return DropdownButtonFormField<Account>(
            items: [],
            onChanged: (_) {},
            decoration: const InputDecoration(labelText: 'Loading Account...'),
          );
        },
        error: (e, _) => Text('Error: $e'),
      );

  // todo: remove id and choose category
  int? _categoryId;

  Widget _buildCategoryRef() {
    return ref
        .watch(categoryProvider)
        .when(
          data: (allCats) {
            // Filter categories based on modal type
            final filteredCats =
                allCats
                    .where((cat) => cat.isIncome == widget.isIncome)
                    .toList();

            // Reset _categoryId if it doesn't match the modal type
            if (_categoryId != null) {
              final currentCat = allCats.firstWhereOrNull(
                (cat) => cat.id == _categoryId,
              );
              if (currentCat == null ||
                  currentCat.isIncome != widget.isIncome) {
                _categoryId = null;
              }
            }

            return DropdownButtonFormField<int>(
              value: _categoryId,
              items:
                  filteredCats.map((cat) {
                    return DropdownMenuItem<int>(
                      value: cat.id,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text(cat.name), Text(cat.emoji)],
                      ),
                    );
                  }).toList(),
              onChanged: (id) => setState(() => _categoryId = id),
              decoration: const InputDecoration(labelText: 'Category'),
            );
          },
          loading: () {
            return DropdownButtonFormField<int>(
              items: [],
              onChanged: (_) {},
              decoration: const InputDecoration(
                labelText: 'Loading Categories...',
              ),
            );
          },
          error: (e, _) => Text('Error: $e'),
        );
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final title = isEditing ? 'Edit Transaction' : 'New Transaction';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Center(
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
