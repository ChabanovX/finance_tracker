// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(sharedPrefs)
const sharedPrefsProvider = SharedPrefsProvider._();

final class SharedPrefsProvider
    extends
        $FunctionalProvider<
          AsyncValue<SharedPreferences>,
          SharedPreferences,
          FutureOr<SharedPreferences>
        >
    with
        $FutureModifier<SharedPreferences>,
        $FutureProvider<SharedPreferences> {
  const SharedPrefsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPrefsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPrefsHash();

  @$internal
  @override
  $FutureProviderElement<SharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SharedPreferences> create(Ref ref) {
    return sharedPrefs(ref);
  }
}

String _$sharedPrefsHash() => r'c55d8922fdfe442b139e124c11dd2d7e8305501d';

@ProviderFor(backupManager)
const backupManagerProvider = BackupManagerProvider._();

final class BackupManagerProvider
    extends $FunctionalProvider<BackupManager, BackupManager, BackupManager>
    with $Provider<BackupManager> {
  const BackupManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'backupManagerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$backupManagerHash();

  @$internal
  @override
  $ProviderElement<BackupManager> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BackupManager create(Ref ref) {
    return backupManager(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BackupManager value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BackupManager>(value),
    );
  }
}

String _$backupManagerHash() => r'66a0ce1e2ea76c60da4574efda2a0a81d857a145';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
