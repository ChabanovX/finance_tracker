// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountHistoryDto _$AccountHistoryDtoFromJson(Map<String, dynamic> json) =>
    _AccountHistoryDto(
      id: (json['id'] as num).toInt(),
      accountId: (json['accountId'] as num).toInt(),
      changeType: const ChangeTypeConverter().fromJson(
        json['changeType'] as String,
      ),
      previousState:
          json['previousState'] == null
              ? null
              : AccountStateDto.fromJson(
                json['previousState'] as Map<String, dynamic>,
              ),
      newState: AccountStateDto.fromJson(
        json['newState'] as Map<String, dynamic>,
      ),
      changeTimestamp: DateTime.parse(json['changeTimestamp'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$AccountHistoryDtoToJson(_AccountHistoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountId': instance.accountId,
      'changeType': const ChangeTypeConverter().toJson(instance.changeType),
      'previousState': instance.previousState,
      'newState': instance.newState,
      'changeTimestamp': instance.changeTimestamp.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
    };
