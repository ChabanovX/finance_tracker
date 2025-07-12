import 'package:fuzzywuzzy/fuzzywuzzy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yndx_homework/features/articles/domain/models/article.dart';
import 'package:yndx_homework/shared/providers/repository_providers.dart';

part 'providers.g.dart';

@riverpod
class ArticleSearchQuery extends _$ArticleSearchQuery {
  @override
  String build() {
    return '';
  }
}

@riverpod
Future<List<Article>> articles(Ref ref) {
  return ref.watch(articlesRepositoryProvider).getArticles();
}

@riverpod
List<Article> filteredArticles(Ref ref) {
  final query = ref.watch(articleSearchQueryProvider);
  final List<Article> list = ref
      .watch(articlesProvider)
      .maybeWhen(orElse: () => []);

  if (query.isEmpty) return list;

  return extractAll(
    query: query,
    choices: list,
    getter: (obj) => obj.text,
  ).map((e) => e.choice).toList();
}
