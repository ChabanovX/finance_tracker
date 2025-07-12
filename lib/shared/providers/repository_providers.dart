import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/articles/data/repos/mock_articles_repository.dart';
import '../../features/account/data/repos/objectbox_account_repository.dart';
import '../../features/transactions/data/repos/objectbox_category_repository.dart';
import '../../features/transactions/data/repos/objectbox_transactions_repository.dart';
import '../../features/account/domain/repos/account_repository.dart';
import '../../features/articles/domain/repos/articles_repository.dart';
import '../../features/transactions/domain/repos/category_repository.dart';
import '../../features/transactions/domain/repos/transactions_repository.dart';
import 'objectbox_provider.dart';

part 'repository_providers.g.dart';

@riverpod
IArticlesRepository articlesRepository(Ref ref) {
  return MockArticlesRepository();
}

@riverpod
ITransactionsRepository transactionsRepository(Ref ref) {
  return TransactionsObjectBoxRepository(ref.watch(objectboxProvider));
}

@riverpod
IAccountRepository accountRepository(Ref ref) {
  return AccountObjectBoxRepository(ref.watch(objectboxProvider));
}

@riverpod
ICategoryRepository categoriesRepository(Ref ref) {
  return CategoryObjectBoxRepository(ref.watch(objectboxProvider));
}
