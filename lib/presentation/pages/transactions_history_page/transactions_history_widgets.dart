part of 'transactions_history_page.dart';

String _fmt(DateTime d) {
  final mm = d.month.toString().padLeft(2, '0');
  final dd = d.day.toString().padLeft(2, '0');
  return '$dd.$mm.${d.year}';
}

class _DateTile extends StatelessWidget {
  const _DateTile({
    required this.label,
    required this.date,
    required this.onTap,
  });

  final String label;
  final DateTime date;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DefaultHeaderListTile(
        leading: Text(label),
        trailing: Text(_fmt(date)),
      ),
    );
  }
}

class _SortTile extends StatelessWidget {
  const _SortTile({required this.sortBy, required this.onChange});

  final SortBy sortBy;
  final ValueChanged<SortBy> onChange;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final result = await showModalBottomSheet<SortBy>(
          context: context,
          builder:
              (ctx) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text('По дате'),
                    onTap: () => Navigator.pop(ctx, SortBy.date),
                  ),
                  ListTile(
                    title: const Text('По сумме'),
                    onTap: () => Navigator.pop(ctx, SortBy.amount),
                  ),
                ],
              ),
        );
        if (result != null) onChange(result);
      },
      child: DefaultHeaderListTile(
        leading: const Text('Сортировка'),
        trailing: Text(sortBy == SortBy.date ? 'По дате' : 'По сумме'),
      ),
    );
  }
}

class _HistoryList extends StatelessWidget {
  const _HistoryList(this.transactions);

  final List<Transaction> transactions;

  /// Shows modal popup for changing transaction.
  // void _onTap(BuildContext context, Transaction t) => showGeneralDialog(
  //   context: context,
  //   barrierDismissible: true,
  //   pageBuilder: (ctx, animation1, animation2) {
  //     return Center(
  //       child: Material(child: Container(height: 100, color: Colors.red)),
  //     );
  //   },
  // );

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: transactions.length + 1,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (ctx, index) {
        if (index == transactions.length) {
          return const SizedBox(height: 16);
        }
        final t = transactions[index];
        return DefaultListTile(
          transaction: t,
          isFirstInList: index == 0,
        );
      },
    );
  }
}

class _HistoryLoading extends StatelessWidget {
  const _HistoryLoading();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
