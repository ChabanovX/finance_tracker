import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yndx_homework/features/settings/providers.dart';

import 'core/navigation/app_route_config.dart' show AppRouterDelegate;
import 'core/theme/app_theme.dart';
import 'core/widgets/router_error_handler.dart';

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> with WidgetsBindingObserver {
  late final AppRouterDelegate _routerDelegate;
  bool _isBlurred = false;

  @override
  void initState() {
    // Log.info('Current network state: ${ref.read(networkStateProvider)}');
    super.initState();
    _routerDelegate = AppRouterDelegate();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      setState(() => _isBlurred = true);
    } else if (state == AppLifecycleState.resumed) {
      setState(() => _isBlurred = false);
    }
  }

  @override
  void dispose() {
    _routerDelegate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSystem = ref.watch(isSystemModeProvider);
    final tintColor = ref
        .watch(tintColorProvider)
        .maybeWhen(data: (c) => c, orElse: () => AppColors.kAccent);

    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      title: 'Finance Tracker',
      theme: buildAppTheme(tintColor),
      darkTheme: buildAppDarkTheme(tintColor),
      themeMode: isSystem ? ThemeMode.system : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routerDelegate: _routerDelegate,
      builder:
          (context, child) => RouterErrorHandler(
            routerDelegate: _routerDelegate,
            child: Stack(
              children: [
                child!,
                if (_isBlurred)
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
              ],
            ),
          ),
    );
  }
}
