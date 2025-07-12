// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(ErrorHandler)
const errorHandlerProvider = ErrorHandlerProvider._();

final class ErrorHandlerProvider
    extends $NotifierProvider<ErrorHandler, AppError?> {
  const ErrorHandlerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'errorHandlerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$errorHandlerHash();

  @$internal
  @override
  ErrorHandler create() => ErrorHandler();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppError? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppError?>(value),
    );
  }
}

String _$errorHandlerHash() => r'a41b78c6f98033c0f6efbec993618fe943aa265a';

abstract class _$ErrorHandler extends $Notifier<AppError?> {
  AppError? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AppError?, AppError?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppError?, AppError?>,
              AppError?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(GlobalErrorNotifier)
const globalErrorNotifierProvider = GlobalErrorNotifierProvider._();

final class GlobalErrorNotifierProvider
    extends $NotifierProvider<GlobalErrorNotifier, List<AppError>> {
  const GlobalErrorNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'globalErrorNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$globalErrorNotifierHash();

  @$internal
  @override
  GlobalErrorNotifier create() => GlobalErrorNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<AppError> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<AppError>>(value),
    );
  }
}

String _$globalErrorNotifierHash() =>
    r'cd113a3d34bb47cebc55de640a394e607b6ed361';

abstract class _$GlobalErrorNotifier extends $Notifier<List<AppError>> {
  List<AppError> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<AppError>, List<AppError>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<AppError>, List<AppError>>,
              List<AppError>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
