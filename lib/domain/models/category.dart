import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart'; 

@freezed
abstract class Category with _$Category {
  const factory Category({
    required int id,
    required String name,
    required String emoji,
    required bool isIncome,
  }) = _Category;
}
