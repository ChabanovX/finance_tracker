import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String message;
  final String? title;
  final VoidCallback? onRetry;
  final VoidCallback? onDismiss;
  
  const ErrorDialog({
    super.key,
    required this.message,
    this.title,
    this.onRetry,
    this.onDismiss,
  });
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title ?? 'Ошибка'),
      content: SingleChildScrollView(
        child: Text(message),
      ),
      actions: [
        if (onRetry != null)
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onRetry?.call();
            },
            child: const Text('Повторить'),
          ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onDismiss?.call();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
  
  static Future<void> show(
    BuildContext context, {
    required String message,
    String? title,
    VoidCallback? onRetry,
    VoidCallback? onDismiss,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => ErrorDialog(
        message: message,
        title: title,
        onRetry: onRetry,
        onDismiss: onDismiss,
      ),
    );
  }
}
