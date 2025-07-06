import 'package:logging/logging.dart';
import 'package:flutter/foundation.dart';

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
      debugPrint(
        '${record.time.toIso8601String()} [${record.level.name}] ${record.message}',
      );
      if (record.error != null) debugPrint('Error: ${record.error}');
      if (record.stackTrace != null) debugPrint(record.stackTrace.toString());
    });
  }
}