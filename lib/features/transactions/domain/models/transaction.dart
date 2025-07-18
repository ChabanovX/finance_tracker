import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../account/domain/models/account.dart';
import 'category.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
abstract class Transaction with _$Transaction {
  const factory Transaction({
    required int id,
    required Account account,
    required Category category,
    required double amount,
    required DateTime transactionDate,
    required String? comment,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
