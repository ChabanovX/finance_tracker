// lib/core/widgets/router_error_handler.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yndx_homework/shared/providers/error_providers.dart';
import '../navigation/app_route_config.dart';
import 'error_dialog.dart';

class RouterErrorHandler extends ConsumerWidget {
  final Widget child;
  final AppRouterDelegate routerDelegate;
  
  const RouterErrorHandler({
    Key? key,
    required this.child,
    required this.routerDelegate,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to global errors
    ref.listen(globalErrorNotifierProvider, (previous, next) {
      if (next.isNotEmpty) {
        final error = next.last;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _showErrorDialog(context, ref, error);
        });
      }
    });
    
    // Listen to single error handler
    ref.listen(errorHandlerProvider, (previous, next) {
      if (next != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _showErrorDialog(context, ref, next);
        });
      }
    });
    
    return child;
  }
  
  void _showErrorDialog(BuildContext context, WidgetRef ref, AppError error) {
    // Use the root navigator context for error dialogs
    final rootNavigatorContext = routerDelegate.navigatorKey?.currentContext;
    final dialogContext = rootNavigatorContext ?? context;
    
    ErrorDialog.show(
      dialogContext,
      message: error.message,
      title: error.title,
      onRetry: error.onRetry,
      onDismiss: () {
        if (error.runtimeType == AppError) {
          ref.read(errorHandlerProvider.notifier).clearError();
        } else {
          ref.read(globalErrorNotifierProvider.notifier).removeError(error);
        }
      },
    );
  }
}
