import 'package:yndx_homework/data/models/dto/category_dto.dart';
import 'package:yndx_homework/domain/models/category.dart';

extension CategoryDtoMapper on CategoryDto {
  Category toDomain() =>
      Category(id: id, name: name, emoji: emoji, isIncome: isIncome);
}
