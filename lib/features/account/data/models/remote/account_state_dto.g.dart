// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_state_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountStateDto _$AccountStateDtoFromJson(Map<String, dynamic> json) =>
    _AccountStateDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      balance: const StringToDoubleConverter().fromJson(
        json['balance'] as String,
      ),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$AccountStateDtoToJson(_AccountStateDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'balance': const StringToDoubleConverter().toJson(instance.balance),
      'currency': instance.currency,
    };
