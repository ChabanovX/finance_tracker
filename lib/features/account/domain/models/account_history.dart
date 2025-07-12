import 'package:freezed_annotation/freezed_annotation.dart';
import 'change_type.dart';
import 'account_state.dart';

part 'account_history.freezed.dart';

@freezed
abstract class AccountHistory with _$AccountHistory {
  const factory AccountHistory({
    required int id,
    required int accountId,
    required ChangeType changeType,
    AccountState? previousState,
    required AccountState newState,
    required DateTime changeTimestamp,
  }) = _AccountHistory;
}
