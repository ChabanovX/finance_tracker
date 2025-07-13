import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yndx_homework/features/transactions/domain/models/category.dart';
import 'package:yndx_homework/features/transactions/domain/models/transaction.dart';

part 'transaction_view.freezed.dart';

@freezed
abstract class TransactionView with _$TransactionView {
  const factory TransactionView({
    required List<Transaction> sorted,
    required double total,
    required Map<Category, List<Transaction>> byCategory,
  }) = _TransactionView;
}
