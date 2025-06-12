import 'package:freezed_annotation/freezed_annotation.dart';
import 'converters/string_to_double_converter.dart';

part 'account_update_request_dto.freezed.dart';
part 'account_update_request_dto.g.dart';

@freezed
abstract class AccountUpdateRequestDto with _$AccountUpdateRequestDto {
  const AccountUpdateRequestDto._();

  const factory AccountUpdateRequestDto({
    required String name,
    @StringToDoubleConverter() required double balance,
    required String currency,
  }) = _AccountUpdateRequestDto;

  factory AccountUpdateRequestDto.fromJson(Map<String, dynamic> json) => _$AccountUpdateRequestDtoFromJson(json);
}
