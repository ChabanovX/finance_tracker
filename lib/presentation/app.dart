import 'package:flutter/material.dart';

import '/core/navigation/app_route_config.dart' show AppRouterDelegate;
import '/presentation/theme/app_theme.dart' show appTheme, appDarkTheme;

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