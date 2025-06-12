import 'package:freezed_annotation/freezed_annotation.dart';
import 'converters/string_to_double_converter.dart';

part 'account_brief_dto.freezed.dart';
part 'account_brief_dto.g.dart';

@freezed
abstract class AccountBriefDto with _$AccountBriefDto {
  const factory AccountBriefDto({
    required int id,
    required String name,
    @StringToDoubleConverter() required double balance,
    required String currency,
  }) = _AccountBriefDto;

  factory AccountBriefDto.fromJson(Map<String, dynamic> json) => _$AccountBriefDtoFromJson(json);
}
