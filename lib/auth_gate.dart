import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yndx_homework/features/auth/providers.dart';
import 'features/auth/biometric_service.dart';
import 'features/auth/presentation/pin_code_page.dart';
import 'app.dart';

class AuthGate extends ConsumerStatefulWidget {
  const AuthGate({super.key});

  @override
  ConsumerState<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends ConsumerState<AuthGate> {
  bool _unlocked = false;
  bool _biometricAttempted = false;

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
    final pinAsync = ref.watch(pinCodeProvider);

    return pinAsync.when(
      loading: () => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      ),
      error: (e, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Center(child: Text('Error: $e'))),
      ),
      data: (pin) {
        if (pin != null && !_unlocked) {
          if (!_biometricAttempted) {
            _biometricAttempted = true;
            _tryBiometric();
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: PinCodePage(
              mode: PinPageMode.verify,
              onSuccess: _unlock,
            ),
          );
        }
        return const MainApp();
      },
    );
  }
}
