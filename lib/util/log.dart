import 'package:logging/logging.dart';
import 'package:flutter/foundation.dart';

const _reset = '\x1B[0m';
const _red = '\x1B[31m';
const _yellow = '\x1B[33m';
const _green = '\x1B[32m';
const _grey = '\x1B[90m';

String _colorFor(Level level) {
  if (level >= Level.SEVERE) return _red; // errors
  if (level >= Level.WARNING) return _yellow; // warnings
  if (level >= Level.INFO) return _green; // info
  return _grey; // fine/finer/fine-st
}

/// Simple wrapper over the [logging] package.
class Log {
  Log._();

  static final Logger _logger = Logger('FinanceTracker');

  /// Log debug messages.
  static void debug(String message, {Object? error, StackTrace? stackTrace}) {
    _logger.fine(message, error, stackTrace);
  }

  /// Log informational messages.
  static void info(String message, {Object? error, StackTrace? stackTrace}) {
    _logger.info(message, error, stackTrace);
  }

  /// Log error messages.
  static void error(String message, {Object? error, StackTrace? stackTrace}) {
    _logger.severe(message, error, stackTrace);
  }

  /// Initialize logging to print records to the console.
  static void init() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      final color = _colorFor(record.level);
      final ts = record.time.toIso8601String();
      final msg =
          '$color$ts [${record.level.name.padRight(7)} ${record.message}$_reset]';

      debugPrint(msg);
      if (record.error != null) debugPrint('Error: ${record.error}$_reset');
      if (record.stackTrace != null) debugPrint('$color${record.stackTrace}$_reset');
    });
  }
}
