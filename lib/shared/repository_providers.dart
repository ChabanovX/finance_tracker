import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/data/repositories/mock_articles_repository.dart';
import '/data/repositories/objectbox_account_repository.dart';
import '/data/repositories/objectbox_category_repository.dart';
import '/data/repositories/objectbox_transactions_repository.dart';
import '/domain/repositories/account_repository.dart';
import '/domain/repositories/articles_repository.dart';
import '/domain/repositories/category_repository.dart';
import '/domain/repositories/transactions_repository.dart';
import '/shared/objectbox_provider.dart';

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
