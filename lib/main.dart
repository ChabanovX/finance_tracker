import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/navigation/app_route_config.dart' show AppRouterDelegate;
import 'presentation/theme/app_theme.dart' show appTheme, appDarkTheme;

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Finance Tracker',
      theme: appTheme,
      darkTheme: appDarkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routerDelegate: AppRouterDelegate(),
    );
  }
}
