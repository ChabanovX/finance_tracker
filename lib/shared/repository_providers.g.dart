// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(articlesRepository)
const articlesRepositoryProvider = ArticlesRepositoryProvider._();

final class ArticlesRepositoryProvider
    extends
        $FunctionalProvider<
          IArticlesRepository,
          IArticlesRepository,
          IArticlesRepository
        >
    with $Provider<IArticlesRepository> {
  const ArticlesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'articlesRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$articlesRepositoryHash();

  @$internal
  @override
  $ProviderElement<IArticlesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IArticlesRepository create(Ref ref) {
    return articlesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IArticlesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IArticlesRepository>(value),
    );
  }
}

String _$articlesRepositoryHash() =>
    r'0a4ffcff32e7041669e08b291376f490ca65386f';

@ProviderFor(transactionsRepository)
const transactionsRepositoryProvider = TransactionsRepositoryProvider._();

final class TransactionsRepositoryProvider
    extends
        $FunctionalProvider<
          ITransactionsRepository,
          ITransactionsRepository,
          ITransactionsRepository
        >
    with $Provider<ITransactionsRepository> {
  const TransactionsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionsRepositoryHash();

  @$internal
  @override
  $ProviderElement<ITransactionsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ITransactionsRepository create(Ref ref) {
    return transactionsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ITransactionsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ITransactionsRepository>(value),
    );
  }
}

String _$transactionsRepositoryHash() =>
    r'54850d2f75813796f6d8690e4bb83ab16704ffc4';

@ProviderFor(accountRepository)
const accountRepositoryProvider = AccountRepositoryProvider._();

final class AccountRepositoryProvider
    extends
        $FunctionalProvider<
          IAccountRepository,
          IAccountRepository,
          IAccountRepository
        >
    with $Provider<IAccountRepository> {
  const AccountRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'accountRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$accountRepositoryHash();

  @$internal
  @override
  $ProviderElement<IAccountRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IAccountRepository create(Ref ref) {
    return accountRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IAccountRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IAccountRepository>(value),
    );
  }
}

String _$accountRepositoryHash() => r'8ec12ebe966844b2e5977863aaf097b78c46263c';

@ProviderFor(categoriesRepository)
const categoriesRepositoryProvider = CategoriesRepositoryProvider._();

final class CategoriesRepositoryProvider
    extends
        $FunctionalProvider<
          ICategoryRepository,
          ICategoryRepository,
          ICategoryRepository
        >
    with $Provider<ICategoryRepository> {
  const CategoriesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoriesRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoriesRepositoryHash();

  @$internal
  @override
  $ProviderElement<ICategoryRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ICategoryRepository create(Ref ref) {
    return categoriesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ICategoryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ICategoryRepository>(value),
    );
  }
}

String _$categoriesRepositoryHash() =>
    r'a44fd5c9795f79f45a84c17335053911cc231175';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
