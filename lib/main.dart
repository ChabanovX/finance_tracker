import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/presentation/app.dart' show MainApp;

void main() {
  runApp(const ProviderScope(child: MainApp()));
}
