// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(authToken)
const authTokenProvider = AuthTokenProvider._();

final class AuthTokenProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  const AuthTokenProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authTokenProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authTokenHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return authToken(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$authTokenHash() => r'a2905126624f676018bfb1b516f61bb170a8c720';

@ProviderFor(networkClient)
const networkClientProvider = NetworkClientProvider._();

final class NetworkClientProvider
    extends $FunctionalProvider<NetworkClient, NetworkClient, NetworkClient>
    with $Provider<NetworkClient> {
  const NetworkClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkClientHash();

  @$internal
  @override
  $ProviderElement<NetworkClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NetworkClient create(Ref ref) {
    return networkClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NetworkClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NetworkClient>(value),
    );
  }
}

String _$networkClientHash() => r'956e8ce3a8985198bb330a864dc98aeb7c97b872';

@ProviderFor(NetworkState)
const networkStateProvider = NetworkStateProvider._();

final class NetworkStateProvider
    extends $StreamNotifierProvider<NetworkState, bool> {
  const NetworkStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkStateHash();

  @$internal
  @override
  NetworkState create() => NetworkState();
}

String _$networkStateHash() => r'623651fee33a7b91345fc0ceff5d324a29d29fe5';

abstract class _$NetworkState extends $StreamNotifier<bool> {
  Stream<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(isConnected)
const isConnectedProvider = IsConnectedProvider._();

final class IsConnectedProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  const IsConnectedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isConnectedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isConnectedHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return isConnected(ref);
  }
}

String _$isConnectedHash() => r'e677f55da79154fbbf21eeda9c0d8cc9cdf34e7d';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
