import 'package:freezed_annotation/freezed_annotation.dart';
import 'converters/string_to_double_converter.dart';

part 'stat_item_dto.freezed.dart';
part 'stat_item_dto.g.dart';

@freezed
abstract class StatItemDto with _$StatItemDto {
  const factory StatItemDto({
    required int categoryId,
    required String categoryName,
    required String emoji,
    @StringToDoubleConverter() required double amount,
  }) = _StatItemDto;

  factory StatItemDto.fromJson(Map<String, dynamic> json) => _$StatItemDtoFromJson(json);
}
