import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'biometric_service.dart';
import 'pin_code_service.dart';

class PinCodeNotifier extends AsyncNotifier<String?> {
  @override
  Future<String?> build() => PinCodeService.get();

  Future<void> set(String? code) async {
    state = const AsyncValue.loading();
    if (code == null) {
      await PinCodeService.clear();
    } else {
      await PinCodeService.save(code);
    }
    state = AsyncValue.data(code);
  }
}

class BiometricNotifier extends Notifier<bool> {
  @override
  bool build() {
    unawaited(_init());
    return false;
  }

  Future<void> _init() async {
    final stored = await BiometricService.isEnabled();
    if (state != stored) state = stored;
  }

  void set(bool value) {
    state = value;
    BiometricService.setEnabled(value);
  }

  void toggle() => set(!state);
}

final pinCodeProvider =
    AsyncNotifierProvider<PinCodeNotifier, String?>(PinCodeNotifier.new);
final biometricEnabledProvider =
    NotifierProvider<BiometricNotifier, bool>(BiometricNotifier.new);
