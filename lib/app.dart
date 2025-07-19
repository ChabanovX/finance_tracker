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

class _MainAppState extends ConsumerState<MainApp> {
  late final AppRouterDelegate _routerDelegate;

  @override
  void initState() {
    // Log.info('Current network state: ${ref.read(networkStateProvider)}');
    super.initState();
    _routerDelegate = AppRouterDelegate();
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
        .maybeWhen(data: (c) => c, orElse: () => context.colors.accent);

    return RouterErrorHandler(
      routerDelegate: _routerDelegate,
      child: MaterialApp.router(
        title: 'Finance Tracker',
        theme: buildAppTheme(tintColor),
        darkTheme: buildAppDarkTheme(tintColor),
        themeMode: isSystem ? ThemeMode.system : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        routerDelegate: _routerDelegate,
      ),
    );
  }
}
