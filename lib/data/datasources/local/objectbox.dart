import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:yndx_homework/data/datasources/remote/mappers.dart';
import 'package:yndx_homework/domain/models/category.dart';
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
    final appDir = await getApplicationSupportDirectory();
    final store = await openStore(
      directory: p.join(appDir.path, 'object-box'),
      macosApplicationGroup: 'group.cha.money',
    );

    final ob = ObjectBox._create(store);

    // Prepopulate with mock data if boxes are empty.
    if (ob.categoryBox.isEmpty()) _seed(ob);

    return ob;
  }

  /// Populate mock data into database.
  static void _seed(ObjectBox ob) {
    // TODO: add domain there.
    final domains = mockCategories.map((e) => (e.toDomain())).toList();

    ob.store.runInTransaction(TxMode.write, () {
      // Parents first
      final catEntities = domains.map((c) => c.toEntity()).toList();
      ob.categoryBox.putMany(catEntities);

      final accEntiity = mockAccount.toEntity();
      ob.accountBox.put(accEntiity);

      // Build Category -> Entity map by IDENTITY.
      final catMap = <Category, CategoryEntity>{};
      for (var i = 0; i < mockCategories.length; i++) {
        catMap[domains[i]] = catEntities[i];
      }

      // Then children
      final txEntities =
          mockTransactions.map((t) {
            // Not by id, but by identity. (ids invalid at this point)
            final cat = catMap[t.category]!;
            return t.toEntity(accEntiity, cat);
          }).toList();
      ob.transactionBox.putMany(txEntities);
    });
  }
}
