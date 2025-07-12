import 'package:freezed_annotation/freezed_annotation.dart';
import 'category_dto.dart';
import '../../../../account/data/models/remote/account_brief_dto.dart';
import '../../../../../shared/data/converters/string_to_double_converter.dart';

part 'transaction_response_dto.freezed.dart';
part 'transaction_response_dto.g.dart';

@freezed
abstract class TransactionResponseDto with _$TransactionResponseDto {
  const factory TransactionResponseDto({
    required int id,
    required AccountBriefDto account,
    required CategoryDto category,
    @StringToDoubleConverter() required double amount,
    required DateTime transactionDate,
    String? comment,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TransactionResponseDto;

  factory TransactionResponseDto.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseDtoFromJson(json);
}
