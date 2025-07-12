import 'package:yndx_homework/features/transactions/domain/models/category.dart';

abstract interface class ICategoriesRemoteDataSource {
  Future<List<Category>> getAllCategories();
  Future<List<Category>> getIncomeCategories();
  Future<List<Category>> getExpenseCategories();
}

