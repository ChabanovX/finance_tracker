import 'package:yndx_homework/features/transactions/data/models/remote/transaction_request_dto.dart';
import 'package:yndx_homework/features/transactions/domain/models/transaction.dart';

extension TransactionMapper on Transaction {
  TransactionRequestDto toDto() {
    return TransactionRequestDto(
      accountId: account.id,
      categoryId: category.id,
      amount: amount,
      transactionDate: transactionDate,
    );
  }
}
