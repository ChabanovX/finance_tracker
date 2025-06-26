import '/data/datasources/local/mappers.dart';
import '/data/datasources/local/objectbox.dart';
import '/data/datasources/local/objectbox.g.dart';
import '/domain/models/category.dart';
import '/domain/repositories/category_repository.dart';

class CategoryObjectBoxRepository implements ICategoryRepository {
  final ObjectBox _ob;

  CategoryObjectBoxRepository(this._ob);

  @override
  Future<List<Category>> getAllCategories() async {
    return _ob.categoryBox.getAll().map((e) => e.toDomain()).toList();
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
}
