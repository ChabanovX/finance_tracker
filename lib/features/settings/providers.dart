import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yndx_homework/features/settings/theme_service.dart';
import 'package:yndx_homework/features/settings/tint_color_service.dart';

class TintColorNotifier extends AsyncNotifier<Color> {
  @override
  Future<Color> build() async {
    return Color(await TintColorService.get());
  }

  Future<void> set(Color color) async {
    state = AsyncValue.data(color);
    await TintColorService.store(color);
  }
}

class IsSystemModeNotifier extends Notifier<bool> {
  @override
  bool build() {
    // Optimistic UI.
    unawaited(_init());
    return false;
  }

  void set(bool value) {
    state = value;
    ThemeService.saveTheme(value);
  }

  void toggle() {
    set(!state);
  }

  Future<void> _init() async {
    final stored = await ThemeService.isSystemMode();
    if (state != stored) state = stored;
  }
}

final isSystemModeProvider = NotifierProvider<IsSystemModeNotifier, bool>(
  IsSystemModeNotifier.new,
);

final tintColorProvider = AsyncNotifierProvider<TintColorNotifier, Color>(
  TintColorNotifier.new,
);
