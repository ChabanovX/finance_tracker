import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yndx_homework/shared/providers/network_provider.dart';
import 'package:yndx_homework/util/log.dart';

import 'core/navigation/app_route_config.dart' show AppRouterDelegate;
import 'core/theme/app_theme.dart' show appTheme, appDarkTheme;
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
    Log.info('Current network state: ${ref.read(networkStateProvider)}');
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
    return RouterErrorHandler(
      routerDelegate: _routerDelegate,
      child: MaterialApp.router(
        title: 'Finance Tracker',
        theme: appTheme,
        darkTheme: appDarkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        routerDelegate: _routerDelegate,
      ),
    );
  }
}
