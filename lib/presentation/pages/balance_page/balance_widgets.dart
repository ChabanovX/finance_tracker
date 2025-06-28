part of 'balance_page.dart';

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
  const _AnimatedSpoiler({
    super.key,
    required this.revealed,
    required this.child,
  });

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
