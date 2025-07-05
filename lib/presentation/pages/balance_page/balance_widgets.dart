part of 'balance_page.dart';

/// Display mode in chart.
enum _ChartMode { day, month }

/// Currently it is dummy widget. Updates only local state.
class _BalanceHeader extends ConsumerWidget {
  const _BalanceHeader({super.key, required this.onEdit});

  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctrl = ref.watch(_balanceProvider);

    return Column(
      children: [
        InkWell(
          onTap: onEdit,
          child: DefaultHeaderListTile(
            leading: Row(
              children: const [Text('💰'), SizedBox(width: 16), Text('Баланс')],
            ),
            trailing: Row(
              children: [
                _AnimatedSpoiler(
                  revealed: ctrl.isVisible,
                  child: Text(
                    '${ctrl.balance.toStringAsFixed(2)} ${ctrl.currency}',
                  ),
                ),
                const SizedBox(width: 16),
                Icon(
                  Icons.chevron_right_rounded,
                  color: context.colors.inactive.withAlpha((0.3 * 255).toInt()),
                ),
              ],
            ),
          ),
        ),
        const Divider(height: 1),

        InkWell(
          onTap: () async {
            final result = await showModalBottomSheet<_Currency>(
              context: context,
              builder:
                  (ctx) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: const Text('RUB'),
                        onTap: () => Navigator.pop(ctx, _Currency.rub),
                      ),
                      ListTile(
                        title: const Text('EUR'),
                        onTap: () => Navigator.pop(ctx, _Currency.eur),
                      ),
                      ListTile(
                        title: const Text('USD'),
                        onTap: () => Navigator.pop(ctx, _Currency.usd),
                      ),
                    ],
                  ),
            );
            if (result != null) ctrl.setCurrency(result);
          },
          child: DefaultHeaderListTile(
            leading: const Text('Валюта'),
            trailing: Row(
              children: [
                Text(ctrl.currency),
                const SizedBox(width: 16),
                Icon(
                  Icons.chevron_right_rounded,
                  color: context.colors.inactive.withAlpha((0.3 * 255).toInt()),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _AnimatedSpoiler extends StatelessWidget {
  const _AnimatedSpoiler({required this.revealed, required this.child});

  final bool revealed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: IgnorePointer(
            child: AnimatedOpacity(
              opacity: revealed ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 300),
              child: Container(color: context.colors.accentLight),
            ),
          ),
        ),
      ],
    );
  }
}

class _ChartModeSwitch extends ConsumerWidget {
  const _ChartModeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(_chartModeProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SegmentedButton<_ChartMode>(
        segments: const <ButtonSegment<_ChartMode>>[
          ButtonSegment<_ChartMode>(value: _ChartMode.day, label: Text('Дни')),
          ButtonSegment<_ChartMode>(
            value: _ChartMode.month,
            label: Text('Месяцы'),
          ),
        ],
        selected: <_ChartMode>{mode},
        onSelectionChanged: (newSelection) {
          ref.read(_chartModeProvider.notifier).state = newSelection.first;
        },
      ),
    );
  }
}

class _BalanceChart extends ConsumerWidget {
  const _BalanceChart();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(_chartModeProvider);
    final ctrl = ref.watch(_balanceProvider);
    final data =
        mode == _ChartMode.day
            ? ref.watch(_dailyHistoryProvider)
            : ref.watch(_monthlyHistoryProvider);

    final maxY =
        data.map((e) => e.amount).fold<double>(0, (p, e) => max(p, e)) + 10;
    final minY =
        data.map((e) => e.amount).fold<double>(0, (p, e) => min(p, e)) - 10;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BarChart(
        BarChartData(
          minY: minY < 0 ? minY : 0,
          maxY: maxY > 0 ? maxY : 0,
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (BarChartGroupData group) => Colors.black54,
              getTooltipItem: (group, idx, rod, __) {
                final entry = data[group.x.toInt()];
                return BarTooltipItem(
                  '${entry.amount.toStringAsFixed(2)} ${ctrl.currency}',
                  const TextStyle(color: Colors.white),
                );
              },
            ),
          ),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 24,
                interval: 1, // keep axis math happyF
                getTitlesWidget: (value, meta) {
                  final i = value.toInt();
                  final len = data.length;

                  final idxSecond = len > 1 ? 1 : 0;
                  final idxMiddle = len > 2 ? len ~/ 2 : 0;
                  final idxPenultimate = len > 2 ? len - 2 : len - 1;

                  if (i != idxSecond && i != idxMiddle && i != idxPenultimate) {
                    return const SizedBox.shrink(); // skip all others
                  }

                  final date = data[i].date;
                  final fmt =
                      mode == _ChartMode.day
                          ? DateFormat.Md() // e.g. 5/7
                          : DateFormat('MMM'); // e.g. Jul

                  return Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      fmt.format(date),
                      style: const TextStyle(fontSize: 10),
                    ),
                  );
                },
              ),
            ),
          ),
          barGroups: List.generate(data.length, (i) {
            final entry = data[i];
            return BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  toY: entry.amount,
                  width: 12,
                  color: entry.amount >= 0 ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.zero,
                ),
              ],
            );
          }),
        ),
        swapAnimationDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}
