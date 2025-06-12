import 'package:freezed_annotation/freezed_annotation.dart';
import 'account_history_dto.dart';
import 'converters/string_to_double_converter.dart';

part 'account_history_response_dto.freezed.dart';
part 'account_history_response_dto.g.dart';

@freezed
abstract class AccountHistoryResponseDto with _$AccountHistoryResponseDto {
  const factory AccountHistoryResponseDto({
    required int accountId,
    required String accountName,
    required String currency,
    @StringToDoubleConverter() required double currentBalance,
    required List<AccountHistoryDto> history,
  }) = _AccountHistoryResponseDto;

  factory AccountHistoryResponseDto.fromJson(Map<String, dynamic> json) => _$AccountHistoryResponseDtoFromJson(json);
}
