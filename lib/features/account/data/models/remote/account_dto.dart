import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yndx_homework/shared/data/converters/string_to_double_converter.dart';

part 'account_dto.freezed.dart';
part 'account_dto.g.dart';

@freezed
abstract class AccountDto with _$AccountDto {

  const factory AccountDto({
    required int id,
    required int userId,
    required String name,
    @StringToDoubleConverter() required double balance,
    required String currency,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AccountDto;

  factory AccountDto.fromJson(Map<String, dynamic> json) => _$AccountDtoFromJson(json);
}
