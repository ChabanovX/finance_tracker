import 'package:yndx_homework/features/transactions/domain/repos/category_local_datasource.dart';
import 'package:yndx_homework/shared/data/datasources/local/sync_metadata_entity.dart';
import 'package:yndx_homework/shared/data/datasources/mock_data.dart';

import '../../../../shared/data/datasources/local/mappers.dart';
import '../../../../shared/data/datasources/local/objectbox.dart';
import '../../../../shared/data/datasources/local/objectbox.g.dart';
import '../../domain/models/category.dart';

class CategoryObjectBoxRepository implements ICategoriesLocalDataSource {
  final ObjectBox _ob;
  static const String _lastSyncKey = 'categories_last_sync';

  CategoryObjectBoxRepository(this._ob);


  /// Currently problems with categories, mocked ones are used.
  /// TODO: change when fixed.
  @override
  Future<List<Category>> getAllCategories() async {
    return mockCategories;
    // return _ob.categoryBox.getAll().map((e) => e.toDomain()).toList();
  }

  @override
  Future<DateTime?> getLastSyncTime() async {
    final query =
        _ob.syncMetadataBox
            .query(SyncMetadataEntity_.key.equals(_lastSyncKey))
            .build();

    try {
      final result = query.findFirst();
      if (result != null) {
        return DateTime.parse(result.value);
      }
      return null;
    } finally {
      query.close();
    }
  }

  @override
  Future<void> setLastSyncTime(DateTime time) async {
    // Try to find existing record
    final query =
        _ob.syncMetadataBox
            .query(SyncMetadataEntity_.key.equals(_lastSyncKey))
            .build();

    try {
      final existing = query.findFirst();

      if (existing != null) {
        // Update existing record
        existing.value = time.toIso8601String();
        await _ob.syncMetadataBox.putAsync(existing);
      } else {
        // Create new record
        final newRecord = SyncMetadataEntity.create(
          key: _lastSyncKey,
          value: time.toIso8601String(),
        );
        await _ob.syncMetadataBox.putAsync(newRecord);
      }
    } finally {
      query.close();
    }
  }

  @override
  Future<List<Category>> getExpenseCategories() async {
    final query =
        _ob.categoryBox.query(CategoryEntity_.isIncome.equals(false)).build();
    final result = query.find();
    query.close();

    return result.map((e) => e.toDomain()).toList();
  }

  @override
  Future<List<Category>> getIncomeCategories() async {
    final query =
        _ob.categoryBox.query(CategoryEntity_.isIncome.equals(true)).build();
    final result = query.find();
    query.close();

    return result.map((e) => e.toDomain()).toList();
  }

  @override
  Future<void> clearCategories() async {
    await _ob.categoryBox.removeAllAsync();
  }

  @override
  Future<void> saveCategories(List<Category> categories) async {
    final entities = categories.map((c) => c.toEntity()).toList();
    await _ob.categoryBox.putManyAsync(entities, mode: PutMode.put);
  }
}
