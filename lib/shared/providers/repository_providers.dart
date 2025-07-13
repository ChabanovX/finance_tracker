import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yndx_homework/features/account/data/repos/account_remote_ds.dart';
import 'package:yndx_homework/features/account/data/repos/account_repository.dart';
import 'package:yndx_homework/features/transactions/data/repos/category_remote_ds.dart';
import 'package:yndx_homework/features/transactions/data/repos/category_repository.dart';
import 'package:yndx_homework/features/transactions/data/repos/transactions_remote_ds.dart';
import 'package:yndx_homework/features/transactions/data/repos/transactions_repository.dart';
import 'package:yndx_homework/features/transactions/domain/repos/category_local_datasource.dart';
import 'package:yndx_homework/features/transactions/domain/repos/category_remote_datasource.dart';
import 'package:yndx_homework/features/transactions/domain/repos/transactions_local_datasource.dart';
import 'package:yndx_homework/features/transactions/domain/repos/transactions_remote_datasource.dart';
import 'package:yndx_homework/shared/providers/network_provider.dart';
import 'package:yndx_homework/shared/providers/settings_provider.dart';

import '../../features/articles/data/repos/mock_articles_repository.dart';
import '../../features/account/data/repos/account_local_ds.dart';
import '../../features/transactions/data/repos/category_local_ds.dart';
import '../../features/transactions/data/repos/transactions_local_ds.dart';
import '../../features/account/domain/repos/account_repository.dart';
import '../../features/articles/domain/repos/articles_repository.dart';
import '../../features/transactions/domain/repos/category_repository.dart';
import '../../features/transactions/domain/repos/transactions_repository.dart';
import 'objectbox_provider.dart';

part 'repository_providers.g.dart';

@riverpod
ITransactionsLocalDataSource transactionsLocalDatasource(Ref ref) {
  final ob = ref.watch(objectboxProvider);
  return TransactionsLocalDatasource(ob);
}

@riverpod
ITransactionsRemoteDataSource transactionsRemoteDatasource(Ref ref) {
  final networkClient = ref.watch(networkClientProvider);
  return TransactionsRemoteDataSource(networkClient);
}

@riverpod
ITransactionsRepository transactionsRepository(Ref ref) {
  final localDataSource = ref.watch(transactionsLocalDatasourceProvider);
  final remoteDataSource = ref.watch(transactionsRemoteDatasourceProvider);
  final backupManager = ref.watch(backupManagerProvider);
  final networkClient = ref.watch(networkClientProvider);
  return TransactionsRepository(
    localDataSource,
    remoteDataSource,
    backupManager,
    networkClient,
  );
}

@riverpod
IAccountLocalDataSource accountLocalDatasource(Ref ref) {
  final ob = ref.watch(objectboxProvider);
  return AccountObjectBoxRepository(ob);
}

@riverpod
IAccountRemoteDataSource accountRemoteDatasource(Ref ref) {
  final networkClient = ref.watch(networkClientProvider);
  return AccountRemoteDataSource(networkClient);
}

@riverpod
IAccountRepository accountRepository(Ref ref) {
  final localDataSource = ref.watch(accountLocalDatasourceProvider);
  final remoteDataSource = ref.watch(accountRemoteDatasourceProvider);
  final networkClient = ref.watch(networkClientProvider);
  
  return AccountRepository(
    localDataSource,
    remoteDataSource,
    networkClient,
  );
}

@riverpod
ICategoriesLocalDataSource categoriesLocalDatasource(Ref ref) {
  final ob = ref.watch(objectboxProvider);
  return CategoryObjectBoxRepository(ob);
}

@riverpod
ICategoriesRemoteDataSource categoriesRemoteDatasource(Ref ref) {
  final networkClient = ref.watch(networkClientProvider);
  return CategoriesRemoteDataSource(networkClient);
}

@riverpod
ICategoryRepository categoriesRepository(Ref ref) {
  final localDataSource = ref.watch(categoriesLocalDatasourceProvider);
  final remoteDataSource = ref.watch(categoriesRemoteDatasourceProvider);
  final networkClient = ref.watch(networkClientProvider);
  
  return CategoryRepository(
    localDataSource,
    remoteDataSource,
    networkClient,
  );
}

@riverpod
IArticlesRepository articlesRepository(Ref ref) {
  return MockArticlesRepository();
}
