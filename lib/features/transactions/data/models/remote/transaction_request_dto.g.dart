// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionRequestDto _$TransactionRequestDtoFromJson(
  Map<String, dynamic> json,
) => _TransactionRequestDto(
  accountId: (json['accountId'] as num).toInt(),
  categoryId: (json['categoryId'] as num).toInt(),
  amount: const StringToDoubleConverter().fromJson(json['amount'] as String),
  transactionDate: DateTime.parse(json['transactionDate'] as String),
  comment: json['comment'] as String?,
);

Map<String, dynamic> _$TransactionRequestDtoToJson(
  _TransactionRequestDto instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'categoryId': instance.categoryId,
  'amount': const StringToDoubleConverter().toJson(instance.amount),
  'transactionDate': instance.transactionDate.toIso8601String(),
  'comment': instance.comment,
};
