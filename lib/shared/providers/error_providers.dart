import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';

part 'error_providers.g.dart';

class AppError {
  final String message;
  final String? title;
  final VoidCallback? onRetry;
  final DateTime timestamp;
  
  AppError({
    required this.message,
    this.title,
    this.onRetry,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}

@riverpod
class ErrorHandler extends _$ErrorHandler {
  @override
  AppError? build() => null;
  
  void showError(String message, {String? title, VoidCallback? onRetry}) {
    state = AppError(
      message: message,
      title: title,
      onRetry: onRetry,
    );
  }
  
  void clearError() {
    state = null;
  }
}

// Global error notifier for showing errors from anywhere
@riverpod
class GlobalErrorNotifier extends _$GlobalErrorNotifier {
  @override
  List<AppError> build() => [];
  
  void addError(AppError error) {
    state = [...state, error];
  }
  
  void removeError(AppError error) {
    state = state.where((e) => e != error).toList();
  }
  
  void clearAllErrors() {
    state = [];
  }
}
