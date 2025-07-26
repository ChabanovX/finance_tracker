import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:yndx_homework/app.dart';
import 'package:yndx_homework/shared/data/datasources/local/objectbox.dart';
import 'package:yndx_homework/shared/providers/objectbox_provider.dart';

void main() {
  patrolTest(
    'Start',
    framePolicy: LiveTestWidgetsFlutterBindingFramePolicy.fullyLive,
    ($) async {
      final objectBox = await ObjectBox.init();

      await $.pumpWidgetAndSettle(
        ProviderScope(
          overrides: [objectboxProvider.overrideWithValue(objectBox)],
          child: const MainApp(),
        ),
      );

      expect($('Expenses Today').exists, true);
    },
  );
}
