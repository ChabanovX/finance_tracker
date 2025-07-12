import 'package:yndx_homework/features/transactions/data/models/remote/category_dto.dart';
import 'package:yndx_homework/features/transactions/domain/models/category.dart';

extension CategoryDtoMapper on CategoryDto {
  Category toDomain() =>
      Category(id: id, name: name, emoji: emoji, isIncome: isIncome);
}
