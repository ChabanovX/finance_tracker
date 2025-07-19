part of 'settings_page.dart';

class _SettingsTile extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final Widget? trailing;

  const _SettingsTile({
    super.key,
    required this.title,
    this.onPressed,
    this.trailing = const Icon(Icons.play_arrow_rounded, size: 16),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(child: ListTile(title: Text(title), trailing: trailing));
  }
}

class _Switcher extends ConsumerWidget {
  const _Switcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSystemMode = ref.watch(isSystemModeProvider);
    final notifier = ref.watch(isSystemModeProvider.notifier);

    return Switch(
      value: isSystemMode,
      onChanged: (newValue) {
        notifier.set(newValue);
      },
    );
  }
}

class _ColorPicker extends ConsumerWidget {
  const _ColorPicker({super.key});

  Future<void> _pickColor(
    BuildContext context,
    WidgetRef ref,
    Color current,
  ) async {
    Color selected = current;
    await showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Выберите цвет'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: current,
              onColorChanged: (c) => selected = c,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                ref.read(tintColorProvider.notifier).set(selected);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tintColorAsync = ref.watch(tintColorProvider);

    return tintColorAsync.when(
      data:
          (color) => InkWell(
            child: CircleAvatar(backgroundColor: color, radius: 16,),
            onTap: () => _pickColor(context, ref, color),
          ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, __) => Center(child: Text('Ошибка: $e')),
    );
  }
}
