import 'package:freezed_annotation/freezed_annotation.dart';
import 'account_state_dto.dart';

part 'account_history_dto.freezed.dart';
part 'account_history_dto.g.dart';

@freezed
abstract class AccountHistoryDto with _$AccountHistoryDto {
  const factory AccountHistoryDto({
    required int id,
    required int accountId,
    required String changeType,
    AccountStateDto? previousState,
    required AccountStateDto newState,
    required DateTime changeTimestamp,
    required DateTime createdAt,
  }) = _AccountHistoryDto;

  factory AccountHistoryDto.fromJson(Map<String, dynamic> json) => _$AccountHistoryDtoFromJson(json);
}
