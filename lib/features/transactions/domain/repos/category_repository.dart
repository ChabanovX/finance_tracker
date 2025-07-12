import 'package:yndx_homework/features/transactions/domain/models/category.dart';

abstract interface class ICategoryRepository {
  /// Fetches all available categories
  Future<List<Category>> getAllCategories();

  /// Fetches only income categories.
  Future<List<Category>> getIncomeCategories();

  /// Fetches only expense categories.
  Future<List<Category>> getExpenseCategories();
}
