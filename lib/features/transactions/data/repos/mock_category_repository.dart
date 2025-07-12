import 'package:yndx_homework/shared/data/datasources/mock_data.dart';
import 'package:yndx_homework/shared/data/datasources/remote/mappers.dart';
import 'package:yndx_homework/features/transactions/domain/models/category.dart';
import 'package:yndx_homework/features/transactions/domain/repos/category_repository.dart';

class MockCategoryRepository implements ICategoryRepository {
  /// Duration of fake async call.
  static const _ioDuration = Duration(milliseconds: 500);
  final domains = mockCategories.map((e) => e.toDomain()).toList();

  @override
  Future<List<Category>> getAllCategories() async {
    await Future.delayed(_ioDuration);
    return domains;
  }

  @override
  Future<List<Category>> getIncomeCategories() async {
    await Future.delayed(_ioDuration);
    return domains.where((cat) => cat.isIncome).toList();
  }

  @override
  Future<List<Category>> getExpenseCategories() async {
    await Future.delayed(_ioDuration);
    return domains.where((cat) => !cat.isIncome).toList();
  }
}
