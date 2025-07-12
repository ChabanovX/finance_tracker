import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yndx_homework/shared/providers/error_providers.dart';
import 'error_dialog.dart';

class GlobalErrorHandler extends ConsumerWidget {
  final Widget child;
  
  const GlobalErrorHandler({
    Key? key,
    required this.child,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to global errors
    ref.listen(globalErrorNotifierProvider, (previous, next) {
      if (next.isNotEmpty) {
        final error = next.last;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ErrorDialog.show(
            context,
            message: error.message,
            title: error.title,
            onRetry: error.onRetry,
            onDismiss: () {
              ref.read(globalErrorNotifierProvider.notifier).removeError(error);
            },
          );
        });
      }
    });
    
    // Listen to single error handler
    ref.listen(errorHandlerProvider, (previous, next) {
      if (next != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ErrorDialog.show(
            context,
            message: next.message,
            title: next.title,
            onRetry: next.onRetry,
            onDismiss: () {
              ref.read(errorHandlerProvider.notifier).clearError();
            },
          );
        });
      }
    });
    
    return child;
  }
}
