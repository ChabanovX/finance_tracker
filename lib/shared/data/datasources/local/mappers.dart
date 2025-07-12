import 'package:yndx_homework/features/account/data/models/remote/account_response_dto.dart';
import 'package:yndx_homework/features/account/data/models/remote/account_update_request_dto.dart';

import '../../../../features/account/domain/models/account.dart';
import '../../../../features/transactions/domain/models/category.dart';
import '../../../../features/transactions/domain/models/transaction.dart';

import '../../../../features/account/data/models/local/account_entity.dart';
import '../../../../features/transactions/data/models/local/category_entity.dart';
import '../../../../features/transactions/data/models/local/transaction_entity.dart';

extension AccountEntityMapper on AccountEntity {
  Account toDomain() =>
      Account(id: id, name: name, balance: balance, currency: currency);
}

extension AccountDomainMapper on Account {
  AccountEntity toEntity() =>
      AccountEntity()
        ..id = 0
        ..name = name
        ..balance = balance
        ..currency = currency;
}

extension AccountResponseDtoMapper on AccountResponseDto {
  Account toDomain() {
    return Account(id: id, name: name, balance: balance, currency: currency);
  }
}

extension AccountMapper on Account {
  AccountUpdateRequestDto toDomain() {
    return AccountUpdateRequestDto(name: name, balance: balance, currency: currency);
  }
}

extension CategoryEntityMapper on CategoryEntity {
  Category toDomain() =>
      Category(id: id, name: name, emoji: emoji, isIncome: isIncome);
}

extension CategoryDomainMapper on Category {
  CategoryEntity toEntity() =>
      CategoryEntity()
        ..id = 0
        ..name = name
        ..emoji = emoji
        ..isIncome = isIncome;
}

extension TransactionEntityMapper on TransactionEntity {
  Transaction toDomain(AccountEntity account, CategoryEntity category) =>
      Transaction(
        id: id,
        account: account.toDomain(),
        category: category.toDomain(),
        amount: amount,
        transactionDate: transactionDate,
        comment: comment,
      );
}

extension TransactionDomainMapper on Transaction {
  /// Convert a [Transaction] to [TransactionEntity] **after** its [AccountEntity]
  /// and [CategoryEntity] have already been put into ObjectBox. Links are set
  /// via `.target`, so they can never be null.
  TransactionEntity toEntity(
    AccountEntity persistedAccount,
    CategoryEntity persistedCategory,
  ) {
    return TransactionEntity()
      ..id = 0
      ..amount = amount
      ..transactionDate = transactionDate
      ..comment = comment
      ..account.target = persistedAccount
      ..category.target = persistedCategory;
  }
}
