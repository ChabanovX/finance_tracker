// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(ArticleSearchQuery)
const articleSearchQueryProvider = ArticleSearchQueryProvider._();

final class ArticleSearchQueryProvider
    extends $NotifierProvider<ArticleSearchQuery, String> {
  const ArticleSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'articleSearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$articleSearchQueryHash();

  @$internal
  @override
  ArticleSearchQuery create() => ArticleSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$articleSearchQueryHash() =>
    r'd55c38c8e36469408f475c269d36a80212cc69c9';

abstract class _$ArticleSearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(articles)
const articlesProvider = ArticlesProvider._();

final class ArticlesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Article>>,
          List<Article>,
          FutureOr<List<Article>>
        >
    with $FutureModifier<List<Article>>, $FutureProvider<List<Article>> {
  const ArticlesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'articlesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$articlesHash();

  @$internal
  @override
  $FutureProviderElement<List<Article>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Article>> create(Ref ref) {
    return articles(ref);
  }
}

String _$articlesHash() => r'77a83085b23cc66ef94086feff671726dbb77cc6';

@ProviderFor(filteredArticles)
const filteredArticlesProvider = FilteredArticlesProvider._();

final class FilteredArticlesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Article>>,
          List<Article>,
          FutureOr<List<Article>>
        >
    with $FutureModifier<List<Article>>, $FutureProvider<List<Article>> {
  const FilteredArticlesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredArticlesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredArticlesHash();

  @$internal
  @override
  $FutureProviderElement<List<Article>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Article>> create(Ref ref) {
    return filteredArticles(ref);
  }
}

String _$filteredArticlesHash() => r'd6b7cfcad48609cd0ddb8f583701e159013828b1';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
