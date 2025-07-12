import '../models/article.dart';

abstract interface class IArticlesRepository {
  Future<List<Article>> getArticles();
}
