import 'package:yndx_homework/data/models/dto/account_history_dto.dart';
import 'package:yndx_homework/data/models/dto/account_state_dto.dart';
import 'package:yndx_homework/domain/models/account_history.dart';
import 'package:yndx_homework/domain/models/account_state.dart';

extension AccountHistoryDtoMapper on AccountHistoryDto {
  AccountHistory toDomain() {
    return AccountHistory(
      id: id,
      accountId: accountId,
      changeType: changeType,
      newState: newState.toDomain(),
      previousState: previousState?.toDomain(),
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
