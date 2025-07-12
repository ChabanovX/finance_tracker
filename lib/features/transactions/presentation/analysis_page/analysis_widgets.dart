part of 'analysis_page.dart';

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
    this.backgroundColor,
  });

  final String label;
  final DateTime date;
  final VoidCallback onTap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return DefaultHeaderListTile(
      backgroundColor: backgroundColor,
      leading: Text(label, overflow: TextOverflow.ellipsis),
      trailing: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: context.colors.accent,
          shape: const StadiumBorder(),
          elevation: 0,
        ),
        onPressed: onTap,
        child: Text(_fmt(date), overflow: TextOverflow.ellipsis),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList(this.items);

  final List<_CategoryGroup> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length + 1,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (ctx, index) {
        if (index == items.length) {
          return const SizedBox(height: 16);
        }
        final item = items[index];
        return _CategoryTile(item: item, isFirst: index == 0);
      },
    );
  }
}

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({required this.item, required this.isFirst});

  final _CategoryGroup item;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          () => Navigator.of(context).push(
            MaterialPageRoute(
              builder:
                  (_) => _CategoryTransactionsPage(
                    category: item.category,
                    transactions: item.transactions,
                  ),
            ),
          ),
      child: SizedBox(
        height: isFirst ? 68 : 69,
        child: Row(
          children: [
            const SizedBox(width: 16),
            Text(item.category.emoji),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(item.category.name, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Text('${item.total.toString()} ₽'),
            const SizedBox(width: 16),
            Icon(
              Icons.chevron_right_rounded,
              color: context.colors.inactive.withAlpha((0.3 * 255).toInt()),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}

class _CategoryGroup {
  _CategoryGroup(this.category, this.transactions)
    : total = transactions.fold(0, (sum, t) => sum + t.amount) {
    transactions.sort((a, b) => b.transactionDate.compareTo(a.transactionDate));
    last = transactions.first;
  }

  final Category category;
  final List<Transaction> transactions;
  final double total;
  late final Transaction last;
}

class _CategoryTransactionsPage extends StatelessWidget {
  const _CategoryTransactionsPage({
    required this.category,
    required this.transactions,
  });

  final Category category;
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: category.name),
      body: ListView.separated(
        itemCount: transactions.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (ctx, index) {
          final t = transactions[index];
          return DefaultListTile(transaction: t, isFirstInList: index == 0);
        },
      ),
    );
  }
}

@Dependencies([txByCategory])
class _AnalysisChart extends ConsumerWidget {
  const _AnalysisChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groups = ref.watch(txByCategoryProvider).entries.toList();

    final items = <PieChartItem>[];
    for (var i = 0; i < groups.length; i++) {
      final entry = groups[i];
      final total = entry.value.fold<double>(0, (s, t) => s + t.amount);

      items.add(
        PieChartItem(
          entry.key.name,
          total,
          color: Colors.primaries[i % Colors.primaries.length],
        ),
      );
    }

    return Center(child: AnimatedPieChart(items: items));
  }
}

