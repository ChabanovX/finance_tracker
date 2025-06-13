// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_history_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountHistoryResponseDto _$AccountHistoryResponseDtoFromJson(
  Map<String, dynamic> json,
) => _AccountHistoryResponseDto(
  accountId: (json['accountId'] as num).toInt(),
  accountName: json['accountName'] as String,
  currency: json['currency'] as String,
  currentBalance: const StringToDoubleConverter().fromJson(
    json['currentBalance'] as String,
  ),
  history:
      (json['history'] as List<dynamic>)
          .map((e) => AccountHistoryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$AccountHistoryResponseDtoToJson(
  _AccountHistoryResponseDto instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'accountName': instance.accountName,
  'currency': instance.currency,
  'currentBalance': const StringToDoubleConverter().toJson(
    instance.currentBalance,
  ),
  'history': instance.history,
};
