import 'package:yndx_homework/features/account/data/models/remote/account_brief_dto.dart';
import 'package:yndx_homework/features/account/domain/models/account.dart';
import 'package:yndx_homework/features/transactions/data/models/remote/category_dto.dart';
import 'package:yndx_homework/features/transactions/data/models/remote/transaction_response_dto.dart';
import 'package:yndx_homework/features/transactions/domain/models/category.dart';
import 'package:yndx_homework/features/transactions/domain/models/transaction.dart';


extension AccountBriefDtoMapper on AccountBriefDto {
  Account toDomain() {
    return Account(id: id, name: name, balance: balance, currency: currency);
  }
}

extension CategoryDtoMapper on CategoryDto {
  Category toDomain() {
    return Category(id: id, name: name, emoji: emoji, isIncome: isIncome);
  }
}

extension TransactionResponseDtoMapper on TransactionResponseDto {
  Transaction toDomain() {
    return Transaction(
      id: id,
      account: account.toDomain(),
      category: category.toDomain(),
      amount: amount,
      transactionDate: transactionDate,
      comment: comment,
    );
  }
}
