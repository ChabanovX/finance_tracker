import 'package:yndx_homework/data/models/dto/account_history_dto.dart';
import 'package:yndx_homework/data/models/dto/account_state_dto.dart';
import 'package:yndx_homework/domain/models/account_history.dart';
import 'package:yndx_homework/domain/models/account_state.dart';
import 'package:yndx_homework/domain/models/change_type.dart';

extension AccountHistoryDtoMapper on AccountHistoryDto {
  AccountHistory toDomain() {
    return AccountHistory(
      id: id,
      accountId: accountId,
      changeType: switch (changeType) {
        'CREATION' => const ChangeType.creation(),
        'MODIFICATION' => const ChangeType.modification(),
        _ => throw ArgumentError('Unknown changeType from API: $changeType'),
      },
      newState: newState.toDomain(),
      changeTimestamp: changeTimestamp,
    );
  }
}

extension AccountStateDtoMapper on AccountStateDto {
  AccountState toDomain() {
    return AccountState(
      id: id,
      name: name,
      balance: balance,
      currency: currency,
    );
  }
}
