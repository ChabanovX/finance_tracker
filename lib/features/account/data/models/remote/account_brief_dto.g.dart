// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_brief_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountBriefDto _$AccountBriefDtoFromJson(Map<String, dynamic> json) =>
    _AccountBriefDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      balance: const StringToDoubleConverter().fromJson(
        json['balance'] as String,
      ),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$AccountBriefDtoToJson(_AccountBriefDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'balance': const StringToDoubleConverter().toJson(instance.balance),
      'currency': instance.currency,
    };
