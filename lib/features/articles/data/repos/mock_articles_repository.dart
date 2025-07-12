import 'package:yndx_homework/shared/data/datasources/mock_data.dart';
import 'package:yndx_homework/features/articles/domain/models/article.dart';
import 'package:yndx_homework/features/articles/domain/repos/articles_repository.dart';

class MockArticlesRepository implements IArticlesRepository {
  /// Duration of fake async call.
  static const _ioDuration = Duration(milliseconds: 500);

  @override
  Future<List<Article>> getArticles() async {
    await Future.delayed(_ioDuration);
    return mockArticles;
  }
}
