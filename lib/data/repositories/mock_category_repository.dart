import 'package:yndx_homework/data/datasources/mock_data.dart';
import 'package:yndx_homework/domain/models/category.dart';
import 'package:yndx_homework/domain/repositories/category_repository.dart';

class MockCategoryRepository implements ICategoryRepository {
  /// Duration of fake async call.
  static const _ioDuration = Duration(milliseconds: 500);

  @override
  Future<List<Category>> getAllCategories() async {
    await Future.delayed(_ioDuration);
    return mockCategories;
  }

  @override
  Future<List<Category>> getIncomeCategories() async {
    await Future.delayed(_ioDuration);
    return mockCategories.where((cat) => cat.isIncome).toList();
  }

  @override
  Future<List<Category>> getExpenseCategories() async {
    await Future.delayed(_ioDuration);
    return mockCategories.where((cat) => !cat.isIncome).toList();
  }
}
