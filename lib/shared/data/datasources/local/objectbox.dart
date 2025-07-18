import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:yndx_homework/shared/data/datasources/local/sync_metadata_entity.dart';
import 'objectbox.g.dart';

import '../../../../features/account/data/models/local/account_entity.dart';
import '../../../../features/transactions/data/models/local/category_entity.dart';
import '../../../../features/transactions/data/models/local/transaction_entity.dart';

/// Provides access to ObjectBox [Store] and entity boxes.
class ObjectBox {
  late final Store store;
  late final Box<AccountEntity> accountBox;
  late final Box<CategoryEntity> categoryBox;
  late final Box<TransactionEntity> transactionBox;
  late final Box<SyncMetadataEntity> syncMetadataBox;

  ObjectBox._create(this.store) {
    accountBox = store.box<AccountEntity>();
    categoryBox = store.box<CategoryEntity>();
    transactionBox = store.box<TransactionEntity>();
    syncMetadataBox = store.box<SyncMetadataEntity>(); // Add this
  }

  /// Opens the store and loads initial data if boxes are empty.
  static Future<ObjectBox> init() async {
    final appDir = await getApplicationSupportDirectory();
    final store = await openStore(
      directory: p.join(appDir.path, 'object-box'),
      macosApplicationGroup: 'group.cha.money',
    );

    final ob = ObjectBox._create(store);

    if (ob.categoryBox.isEmpty()) _seed(ob);

    return ob;
  }

  /// Populate mock data into database.
  static void _seed(ObjectBox ob) {
    //   // TODO: add domain there.
    //   final domains = mockCategories.map((e) => (e.toDomain())).toList();

    //   ob.store.runInTransaction(TxMode.write, () {
    //     // Parents first
    //     final catEntities = domains.map((c) => c.toEntity()).toList();
    //     ob.categoryBox.putMany(catEntities);

    //     final accEntity = mockAccount.toEntity();
    //     ob.accountBox.put(accEntity);

    //     // Build Category -> Entity map by IDENTITY.
    //     final catMap = <Category, CategoryEntity>{};
    //     for (var i = 0; i < mockCategories.length; i++) {
    //       catMap[domains[i]] = catEntities[i];
    //     }

    //     // Then children
    //     final txEntities =
    //         mockTransactions.map((t) {
    //           // Not by id, but by identity. (ids invalid at this point)
    //           final cat = catMap[t.category]!;
    //           return t.toEntity(accEntity, cat);
    //         }).toList();
    //     ob.transactionBox.putMany(txEntities);
    //   });
  }
}
