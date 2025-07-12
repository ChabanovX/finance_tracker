import 'package:yndx_homework/core/network/network_client.dart';
import 'package:yndx_homework/features/transactions/domain/models/category.dart';
import 'package:yndx_homework/features/transactions/domain/repos/category_local_datasource.dart';
import 'package:yndx_homework/features/transactions/domain/repos/category_remote_datasource.dart';
import 'package:yndx_homework/features/transactions/domain/repos/category_repository.dart';

class CategoryRepository implements ICategoryRepository {
  final ICategoriesLocalDataSource _localDataSource;
  final ICategoriesRemoteDataSource _remoteDataSource;
  final NetworkClient _networkClient;

  static const Duration _cacheExpiration = Duration(hours: 24);

  CategoryRepository(
    this._localDataSource,
    this._remoteDataSource,
    this._networkClient,
  );

  @override
  Future<List<Category>> getAllCategories() async {
    try {
      // Check if we need to sync
      final lastSync = await _localDataSource.getLastSyncTime();
      final shouldSync =
          lastSync == null ||
          DateTime.now().difference(lastSync) > _cacheExpiration;

      // Try to fetch from remote if we should sync and we're online
      if (shouldSync && await _networkClient.isConnected) {
        try {
          final remoteCategories = await _remoteDataSource.getAllCategories();

          // Update local storage
          await _localDataSource.clearCategories();
          await _localDataSource.saveCategories(remoteCategories);
          await _localDataSource.setLastSyncTime(DateTime.now());

          return remoteCategories;
        } catch (e) {
          // Network error, fall back to local data
          print('Failed to sync categories: $e');
        }
      }
    } catch (e) {
      print('Error in getAllCategories: $e');
    }
    // Return local data
    return await _localDataSource.getAllCategories();
  }

  @override
  Future<List<Category>> getExpenseCategories() async {
    // Get all categories first (handles sync)
    final allCategories = await getAllCategories();
    return allCategories.where((category) => !category.isIncome).toList();
  }

  @override
  Future<List<Category>> getIncomeCategories() async {
    // Get all categories first (handles sync)
    final allCategories = await getAllCategories();
    return allCategories.where((category) => category.isIncome).toList();
  }
}
