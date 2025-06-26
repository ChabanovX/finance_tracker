import '/domain/models/account.dart';
import '/domain/models/category.dart';
import '/domain/models/transaction.dart';

import '/data/models/local/account_entity.dart';
import '/data/models/local/category_entity.dart';
import '/data/models/local/transaction_entity.dart';

extension AccountEntityMapper on AccountEntity {
  Account toDomain() => Account(
        id: id,
        name: name,
        balance: balance,
        currency: currency,
      );
}

extension AccountDomainMapper on Account {
  AccountEntity toEntity() => AccountEntity()
    ..id = id
    ..name = name
    ..balance = balance
    ..currency = currency;
}

extension CategoryEntityMapper on CategoryEntity {
  Category toDomain() => Category(
        id: id,
        name: name,
        emoji: emoji,
        isIncome: isIncome,
      );
}

extension CategoryDomainMapper on Category {
  CategoryEntity toEntity() => CategoryEntity()
    ..id = id
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
  TransactionEntity toEntity() => TransactionEntity()
    ..id = id
    ..amount = amount
    ..transactionDate = transactionDate
    ..comment = comment
    ..account.targetId = account.id
    ..category.targetId = category.id;
}