// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objectbox_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(objectbox)
const objectboxProvider = ObjectboxProvider._();

final class ObjectboxProvider
    extends $FunctionalProvider<ObjectBox, ObjectBox, ObjectBox>
    with $Provider<ObjectBox> {
  const ObjectboxProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'objectboxProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$objectboxHash();

  @$internal
  @override
  $ProviderElement<ObjectBox> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ObjectBox create(Ref ref) {
    return objectbox(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ObjectBox value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ObjectBox>(value),
    );
  }
}

String _$objectboxHash() => r'1b676d4b22b137c943f2536587d41be00d228f17';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
