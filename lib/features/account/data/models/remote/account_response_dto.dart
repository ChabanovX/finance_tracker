import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../transactions/data/models/remote/stat_item_dto.dart';
import '../../../../../shared/data/converters/string_to_double_converter.dart';

part 'account_response_dto.freezed.dart';
part 'account_response_dto.g.dart';

@freezed
abstract class AccountResponseDto with _$AccountResponseDto {
  const factory AccountResponseDto({
    required int id,
    required String name,
    @StringToDoubleConverter() required double balance,
    required String currency,
    required List<StatItemDto> incomeStats,
    required List<StatItemDto> expenseStats,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AccountResponseDto;

  factory AccountResponseDto.fromJson(Map<String, dynamic> json) => _$AccountResponseDtoFromJson(json);
}
