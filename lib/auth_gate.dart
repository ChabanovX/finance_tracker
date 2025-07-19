import 'package:flutter/material.dart';
import 'features/auth/biometric_service.dart';
import 'features/auth/presentation/pin_code_page.dart';
import 'app.dart';

class AuthGate extends StatefulWidget {
  final String? initialPin;
  const AuthGate({super.key, this.initialPin});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  bool _unlocked = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialPin == null) {
      _unlocked = true;
    } else {
      _tryBiometric();
    }
  }

  Future<void> _tryBiometric() async {
    final enabled = await BiometricService.isEnabled();
    if (enabled) {
      final res = await BiometricService.authenticate();
      if (mounted && res) {
        setState(() => _unlocked = true);
      }
    }
  }

  void _unlock() => setState(() => _unlocked = true);

  @override
  Widget build(BuildContext context) {
    if (!_unlocked && widget.initialPin != null) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PinCodePage(
          mode: PinPageMode.verify,
          onSuccess: _unlock,
        ),
      );
    }
    return const MainApp();
  }
}
