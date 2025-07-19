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
    return InkWell(
      onTap: onPressed,
      child: ListTile(title: Text(title), trailing: trailing),
    );
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
            child: CircleAvatar(backgroundColor: color, radius: 16),
            onTap: () => _pickColor(context, ref, color),
          ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, __) => Center(child: Text('Ошибка: $e')),
    );
  }
}

class _HapticsSwitcher extends ConsumerWidget {
  const _HapticsSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enabled = ref.watch(hapticsProvider);
    final notifier = ref.watch(hapticsProvider.notifier);

    return Switch(value: enabled, onChanged: notifier.set);
  }
}

class _BiometricSwitcher extends ConsumerWidget {
  const _BiometricSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enabled = ref.watch(biometricEnabledProvider);
    final notifier = ref.watch(biometricEnabledProvider.notifier);

    return Switch(value: enabled, onChanged: notifier.set);
  }
}

class _LanguagePicker extends ConsumerWidget {
  const _LanguagePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    return InkWell(
      onTap: () async {
        final result = await showModalBottomSheet<Locale>(
          context: context,
          builder: (ctx) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('English'),
                onTap: () => Navigator.pop(ctx, const Locale('en')),
              ),
              ListTile(
                title: const Text('Русский'),
                onTap: () => Navigator.pop(ctx, const Locale('ru')),
              ),
            ],
          ),
        );
        if (result != null) {
          ref.read(localeProvider.notifier).set(result);
        }
      },
      child: Text(locale.languageCode.toUpperCase()),
    );
  }
}
