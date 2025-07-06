import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'util/log.dart';
import '/data/datasources/local/objectbox.dart';
import '/presentation/providers.dart';
import '/presentation/app.dart' show MainApp;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Log.init();

  final objectBox = await ObjectBox.init();

  runApp(
    ProviderScope(
      overrides: [objectBoxProvider.overrideWithValue(objectBox)],
      child: MainApp(),
    ),
  );
}
