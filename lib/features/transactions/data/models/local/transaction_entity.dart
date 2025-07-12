import 'package:objectbox/objectbox.dart';

import '../../../../account/data/models/local/account_entity.dart';
import 'category_entity.dart';

@Entity()
class TransactionEntity {
  @Id(assignable: true)
  int id = 0;

  final account = ToOne<AccountEntity>();
  final category = ToOne<CategoryEntity>();

  late double amount;
  late DateTime transactionDate;
  String? comment;

  TransactionEntity();
}
