import 'package:flutter/material.dart';

class ErrorSnackbar {
  static void show(
    BuildContext context, {
    required String message,
    VoidCallback? onRetry,
    Duration duration = const Duration(seconds: 4),
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: duration,
      backgroundColor: Colors.red,
      action: onRetry != null
          ? SnackBarAction(
              label: 'Повторить',
              textColor: Colors.white,
              onPressed: onRetry,
            )
          : null,
    );
    
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
