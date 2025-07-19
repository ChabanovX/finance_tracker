import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yndx_homework/auth_gate.dart';
import 'package:yndx_homework/shared/providers/objectbox_provider.dart';

import 'util/log.dart';
import 'shared/data/datasources/local/objectbox.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Log.init();

  final objectBox = await ObjectBox.init();

  runApp(
    ProviderScope(
      overrides: [objectboxProvider.overrideWithValue(objectBox)],
      child: const AuthGate(),
    ),
  );
}
