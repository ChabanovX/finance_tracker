import 'package:flutter/material.dart';

import '/core/navigation/app_route_config.dart' show AppRouterDelegate;
import '/presentation/theme/app_theme.dart' show appTheme, appDarkTheme;

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final AppRouterDelegate _routerDelegate;

  @override
  void initState() {
    _routerDelegate = AppRouterDelegate();
    super.initState();
  }

  @override
  void dispose() {
    _routerDelegate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Finance Tracker',
      theme: appTheme,
      darkTheme: appDarkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routerDelegate: _routerDelegate,
    );
  }
}