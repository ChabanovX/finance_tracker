import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:yndx_homework/core/theme/app_theme.dart';
import 'package:yndx_homework/shared/presentation/widgets/default_app_bar.dart';

void main() {
  // Initialize Golden Toolkit and load fonts.
  setUpAll(() async {
    await loadAppFonts();
  });

  group('Golden Tests - Default App Bar', () {
    testGoldens('Renders correctly with default theme.', (tester) async {
      final defaultTintColor = Color(0xFF2AE881);

      final widgetUnderTest = MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: buildAppTheme(defaultTintColor),
        darkTheme: buildAppDarkTheme(defaultTintColor),
        home: const Scaffold(appBar: DefaultAppBar(title: 'Title')),
      );

      await tester.pumpWidgetBuilder(
        widgetUnderTest,
        surfaceSize: const Size(375, 100), // <= deterministic width/height
      );

      await tester.pumpAndSettle();

      await screenMatchesGolden(tester, 'default_app_bar', autoHeight: true);
    });
  });
}
