// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_create_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountCreateRequestDto _$AccountCreateRequestDtoFromJson(
  Map<String, dynamic> json,
) => _AccountCreateRequestDto(
  name: json['name'] as String,
  balance: const StringToDoubleConverter().fromJson(json['balance'] as String),
  currency: json['currency'] as String,
);

Map<String, dynamic> _$AccountCreateRequestDtoToJson(
  _AccountCreateRequestDto instance,
) => <String, dynamic>{
  'name': instance.name,
  'balance': const StringToDoubleConverter().toJson(instance.balance),
  'currency': instance.currency,
};
