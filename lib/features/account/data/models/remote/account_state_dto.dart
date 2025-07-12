import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../shared/data/converters/string_to_double_converter.dart';

part 'account_state_dto.freezed.dart';
part 'account_state_dto.g.dart';

@freezed
abstract class AccountStateDto with _$AccountStateDto {
  const factory AccountStateDto({
    required int id,
    required String name,
    @StringToDoubleConverter() required double balance,
    required String currency,
  }) = _AccountStateDto;

  factory AccountStateDto.fromJson(Map<String, dynamic> json) => _$AccountStateDtoFromJson(json);
}
