import 'package:freezed_annotation/freezed_annotation.dart';
import 'converters/string_to_double_converter.dart';

part 'account_create_request_dto.freezed.dart';
part 'account_create_request_dto.g.dart';

@freezed
abstract class AccountCreateRequestDto with _$AccountCreateRequestDto {
  const AccountCreateRequestDto._();

  const factory AccountCreateRequestDto({
    required String name,
    @StringToDoubleConverter() required double balance,
    required String currency,
  }) = _AccountCreateRequestDto;

  factory AccountCreateRequestDto.fromJson(Map<String, dynamic> json) => _$AccountCreateRequestDtoFromJson(json);
}
