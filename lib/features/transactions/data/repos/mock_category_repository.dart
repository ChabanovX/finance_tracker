import 'package:yndx_homework/shared/data/datasources/mock_data.dart';
import 'package:yndx_homework/features/transactions/domain/models/category.dart';
import 'package:yndx_homework/features/transactions/domain/repos/category_repository.dart';

class MockCategoryRepository implements ICategoryRepository {
  /// Duration of fake async call.
  static const _ioDuration = Duration(milliseconds: 500);
  // final domains = mockCategories.map((e) => e.toDomain()).toList();
  
  @override
  Future<List<Category>> getAllCategories() {
    // TODO: implement getAllCategories
    throw UnimplementedError();
  }
  
  @override
  Future<List<Category>> getExpenseCategories() {
    // TODO: implement getExpenseCategories
    throw UnimplementedError();
  }
  
  @override
  Future<List<Category>> getIncomeCategories() {
    // TODO: implement getIncomeCategories
    throw UnimplementedError();
  }

}
