import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';

@freezed
abstract class Article with _$Article {
  const factory Article({
    required int id,
    required String emoji,
    required String text,
  }) = _Article;
}