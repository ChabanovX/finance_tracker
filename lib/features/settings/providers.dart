import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yndx_homework/features/settings/haptics_service.dart';
import 'package:yndx_homework/features/settings/language_service.dart';

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

class HapticsNotifier extends Notifier<bool> {
  @override
  bool build() {
    unawaited(_init());
    return true;
  }

  void set(bool value) {
    state = value;
    HapticsService.saveEnabled(value);
  }

  void toggle() => set(!state);

  Future<void> _init() async {
    final stored = await HapticsService.isEnabled();
    if (state != stored) state = stored;
  }
}

class LocaleNotifier extends Notifier<Locale> {
  @override
  Locale build() {
    unawaited(_init());
    return const Locale('en');
  }

  void set(Locale locale) {
    state = locale;
    LanguageService.set(locale.languageCode);
  }

  Future<void> _init() async {
    final code = await LanguageService.get();
    state = Locale(code);
  }
}

final localeProvider = NotifierProvider<LocaleNotifier, Locale>(
  LocaleNotifier.new,
);

final hapticsProvider = NotifierProvider<HapticsNotifier, bool>(
  HapticsNotifier.new,
);

final isSystemModeProvider = NotifierProvider<IsSystemModeNotifier, bool>(
  IsSystemModeNotifier.new,
);

final tintColorProvider = AsyncNotifierProvider<TintColorNotifier, Color>(
  TintColorNotifier.new,
);
