import 'package:dio/dio.dart';
import 'package:yndx_homework/core/network/network_client.dart';
import 'package:yndx_homework/features/transactions/data/models/remote/category_dto.dart';
import 'package:yndx_homework/features/transactions/domain/models/category.dart';
import 'package:yndx_homework/features/transactions/domain/repos/category_remote_datasource.dart';
import 'package:yndx_homework/shared/data/mappers.dart';

class CategoriesRemoteDataSource implements ICategoriesRemoteDataSource {
  final NetworkClient _networkClient;
  
  CategoriesRemoteDataSource(this._networkClient);
  
  @override
  Future<List<Category>> getAllCategories() async {
    try {
      final response = await _networkClient.dio.get('/categories');
      final List<dynamic> data = response.data;
      return data.map((json) => (CategoryDto.fromJson(json).toDomain())).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
  
  @override
  Future<List<Category>> getIncomeCategories() async {
    try {
      final response = await _networkClient.dio.get('/categories/type/true');
      final List<dynamic> data = response.data;
      return data.map((json) => (CategoryDto.fromJson(json).toDomain())).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
  
  @override
  Future<List<Category>> getExpenseCategories() async {
    try {
      final response = await _networkClient.dio.get('/categories/type/false');
      final List<dynamic> data = response.data;
      return data.map((json) => (CategoryDto.fromJson(json).toDomain())).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
  
  Exception _handleError(DioException e) {
    switch (e.response?.statusCode) {
      case 401:
        return Exception('Unauthorized');
      case 403:
        return Exception('Forbidden');
      case 404:
        return Exception('Categories not found');
      case 500:
        return Exception('Server error');
      default:
        return Exception('Network error: ${e.message}');
    }
  }
}
