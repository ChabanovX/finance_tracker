// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountResponseDto _$AccountResponseDtoFromJson(Map<String, dynamic> json) =>
    _AccountResponseDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      balance: const StringToDoubleConverter().fromJson(
        json['balance'] as String,
      ),
      currency: json['currency'] as String,
      incomeStats:
          (json['incomeStats'] as List<dynamic>)
              .map((e) => StatItemDto.fromJson(e as Map<String, dynamic>))
              .toList(),
      expenseStats:
          (json['expenseStats'] as List<dynamic>)
              .map((e) => StatItemDto.fromJson(e as Map<String, dynamic>))
              .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AccountResponseDtoToJson(_AccountResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'balance': const StringToDoubleConverter().toJson(instance.balance),
      'currency': instance.currency,
      'incomeStats': instance.incomeStats,
      'expenseStats': instance.expenseStats,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
