import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/presentation/widgets/default_app_bar.dart';
import '../providers.dart';
import '../pin_code_service.dart';

enum PinPageMode { setup, verify }

class PinCodePage extends ConsumerStatefulWidget {
  final PinPageMode mode;
  final VoidCallback? onSuccess;
  const PinCodePage({super.key, required this.mode, this.onSuccess});

  @override
  ConsumerState<PinCodePage> createState() => _PinCodePageState();
}

class _PinCodePageState extends ConsumerState<PinCodePage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final pin = _controller.text;
    if (pin.length != 4) return;
    if (widget.mode == PinPageMode.setup) {
      await ref.read(pinCodeProvider.notifier).set(pin);
      widget.onSuccess?.call();
      if (Navigator.of(context).canPop()) Navigator.of(context).pop(true);
    } else {
      final stored = await PinCodeService.get();
      if (stored == pin) {
        widget.onSuccess?.call();
        if (Navigator.of(context).canPop()) Navigator.of(context).pop(true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Неверный код')),
        );
        _controller.clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.mode == PinPageMode.setup
        ? 'Установите код'
        : 'Введите код';
    return Scaffold(
      appBar: DefaultAppBar(title: title),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              obscureText: true,
              maxLength: 4,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              onChanged: (v) {
                if (v.length == 4) {
                  _submit();
                }
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _submit, child: const Text('OK')),
          ],
        ),
      ),
    );
  }
}
