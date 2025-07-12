import 'package:yndx_homework/features/transactions/domain/models/category.dart';

abstract interface class ICategoriesLocalDataSource {
  Future<List<Category>> getAllCategories();
  Future<List<Category>> getIncomeCategories();
  Future<List<Category>> getExpenseCategories();
  Future<void> saveCategories(List<Category> categories);
  Future<void> clearCategories();
  Future<DateTime?> getLastSyncTime();
  Future<void> setLastSyncTime(DateTime time);
}
