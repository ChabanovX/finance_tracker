// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StatItemDto _$StatItemDtoFromJson(Map<String, dynamic> json) => _StatItemDto(
  categoryId: (json['categoryId'] as num).toInt(),
  categoryName: json['categoryName'] as String,
  emoji: json['emoji'] as String,
  amount: const StringToDoubleConverter().fromJson(json['amount'] as String),
);

Map<String, dynamic> _$StatItemDtoToJson(_StatItemDto instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'emoji': instance.emoji,
      'amount': const StringToDoubleConverter().toJson(instance.amount),
    };
