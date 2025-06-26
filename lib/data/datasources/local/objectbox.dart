import 'objectbox.g.dart';

import 'mappers.dart';
import '../mock_data.dart';
import '/data/models/local/account_entity.dart';
import '/data/models/local/category_entity.dart';
import '/data/models/local/transaction_entity.dart';

/// Provides access to ObjectBox [Store] and entity boxes.
class ObjectBox {
  late final Store store;
  late final Box<AccountEntity> accountBox;
  late final Box<CategoryEntity> categoryBox;
  late final Box<TransactionEntity> transactionBox;

  ObjectBox._create(this.store) {
    accountBox = store.box<AccountEntity>();
    categoryBox = store.box<CategoryEntity>();
    transactionBox = store.box<TransactionEntity>();
  }

  /// Opens the store and loads initial data if boxes are empty.
  static Future<ObjectBox> init() async {
    final store = await openStore();
    final ob = ObjectBox._create(store);

    // Prepopulate with mock data if empty
    if (ob.categoryBox.isEmpty()) {
      ob.categoryBox.putMany(mockCategories.map((c) => c.toEntity()).toList());
    }

    if (ob.accountBox.isEmpty()) {
      ob.accountBox.put(mockAccount.toEntity());
    }

    if (ob.transactionBox.isEmpty()) {
      ob.transactionBox.putMany(
        mockTransactions.map((t) => t.toEntity()).toList(),
      );
    }

    return ob;
  }
}
