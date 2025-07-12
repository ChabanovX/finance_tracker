// import 'dart:async';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fuzzywuzzy/fuzzywuzzy.dart';
// import 'package:yndx_homework/domain/models/account.dart';
// import 'package:yndx_homework/domain/models/category.dart';

// import '/data/repositories/mock_articles_repository.dart';
// import '/domain/models/article.dart';
// import '/domain/repositories/articles_repository.dart';
// import '/data/datasources/local/objectbox.dart';
// import '/data/repositories/objectbox_account_repository.dart';
// import '/data/repositories/objectbox_category_repository.dart';
// import '/data/repositories/objectbox_transactions_repository.dart';
// import '/domain/repositories/account_repository.dart';
// import '/domain/repositories/category_repository.dart';
// import '/domain/models/transaction.dart';
// import '/domain/repositories/transactions_repository.dart';

// enum SortBy { date, amount }

// /// ObjectBox instance. Must be overridden in [ProviderScope].
// final objectBoxProvider = Provider<ObjectBox>(
//   (_) => throw UnimplementedError(),
// );

// final transactionRepositoryProvider = Provider<ITransactionsRepository>(
//   (ref) => TransactionsObjectBoxRepository(ref.watch(objectBoxProvider)),
// );

// final accountRepositoryProvider = Provider<IAccountRepository>(
//   (ref) => AccountObjectBoxRepository(ref.watch(objectBoxProvider)),
// );

// final categoryRepositoryProvider = Provider<ICategoryRepository>(
//   (ref) => CategoryObjectBoxRepository(ref.watch(objectBoxProvider)),
// );

// final articlesRepositoryProvider = Provider<IArticlesRepository>(
//   (_) => MockArticlesRepository(),
// );

// final articleSearchQueryProvider = StateProvider<String>((_) => '');

// final articlesProvider = FutureProvider<List<Article>>((ref) {
//   final repo = ref.watch(articlesRepositoryProvider);
//   return repo.getArticles();
// });

// final filteredArticlesProvider = Provider<List<Article>>((ref) {
//   final query = ref.watch(articleSearchQueryProvider);
//   final articles = ref.watch(articlesProvider).value ?? [];
//   if (query.isEmpty) return articles;
//   return extractTop(
//     query: query,
//     choices: articles,
//     limit: articles.length,
//     getter: (Article a) => a.text,
//   ).map((e) => e.choice).toList();
// }, dependencies: [articleSearchQueryProvider, articlesProvider]);

// final accountProvider = FutureProvider<Account>((ref) {
//   final repo = ref.watch(accountRepositoryProvider);
//   return repo.getAccount();
// });

// final categoriesProvider = FutureProvider<List<Category>>((ref) {
//   final repo = ref.watch(categoryRepositoryProvider);
//   return repo.getAllCategories();
// });

// /// Direction of operations (income / expense) - injected from page.
// ///
// /// Overrided via [ProviderScope].
// final isIncomeProvider = Provider<bool>((_) => throw UnimplementedError());

// /// Whether to sort by date or amount
// final sortByProvider = StateProvider<SortBy>((_) => SortBy.date);

// final historyStartProvider = StateProvider.family<DateTime, bool>((
//   _,
//   isIncome,
// ) {
//   final now = DateTime.now();
//   return DateTime(now.year, now.month - 1, now.day);
// });

// final historyEndProvider = StateProvider.family<DateTime, bool>((_, isIncome) {
//   final now = DateTime.now();
//   return DateTime(now.year, now.month, now.day);
// });

// // Derived data
// final sortedTransactionsProvider = Provider<List<Transaction>>((ref) {
//   ref.watch(isIncomeProvider);
//   final list = ref.watch(transactionsProvider).valueOrNull ?? [];
//   final sortBy = ref.watch(sortByProvider);

//   final copy = [...list];
//   switch (sortBy) {
//     case SortBy.amount:
//       copy.sort((a, b) => b.amount.compareTo(a.amount));
//       break;
//     case SortBy.date:
//       copy.sort((a, b) => b.transactionDate.compareTo(a.transactionDate));
//       break;
//   }
//   return copy;
// }, dependencies: [isIncomeProvider, transactionsProvider, sortByProvider]);

// final totalAmountProvider = Provider<double>((ref) {
//   ref.watch(isIncomeProvider);
//   return ref
//       .watch(sortedTransactionsProvider)
//       .fold(0, (sum, t) => sum + t.amount);
// }, dependencies: [isIncomeProvider, sortedTransactionsProvider]);

// /// Today's transactions shortcut
// final transactionForTodayProvider = FutureProvider.family<
//   List<Transaction>,
//   bool
// >((ref, isIncome) async {
//   final repo = ref.watch(transactionRepositoryProvider);

//   final now = DateTime.now();
//   final startOfDay = DateTime(now.year, now.month, now.day);
//   final endOfDay = startOfDay
//       .add(const Duration(days: 1))
//       .subtract(const Duration(milliseconds: 1));

//   final operations = await repo.getTransactionsForPeriod(startOfDay, endOfDay);

//   return operations.where((op) => op.category.isIncome == isIncome).toList();
// });

// /// Safely update startTime.
// void updateStartDate(WidgetRef ref, DateTime newStart) {
//   final isIncome = ref.read(isIncomeProvider);
//   ref.read(historyStartProvider(isIncome).notifier).state = newStart;

//   // Keeping range valid
//   final end = ref.read(historyEndProvider(isIncome));
//   if (newStart.isAfter(end)) {
//     ref.read(historyEndProvider(isIncome).notifier).state = newStart;
//   }
// }

// /// Safely update endTime.
// void updateEndDate(WidgetRef ref, DateTime newEnd) {
//   final isIncome = ref.read(isIncomeProvider);
//   ref.read(historyEndProvider(isIncome).notifier).state = newEnd;

//   // Keeping range valid
//   final start = ref.read(historyStartProvider(isIncome));
//   if (newEnd.isBefore(start)) {
//     ref.read(historyStartProvider(isIncome).notifier).state = newEnd;
//   }
// }

// /// Update both start and end of history at once.
// ///
// /// Method does not check ranging, considering UI checking that.
// void updateRange(WidgetRef ref, DateTime start, DateTime end) {
//   final isIncome = ref.read(isIncomeProvider);
//   ref.read(historyStartProvider(isIncome).notifier).state = start;
//   ref.read(historyEndProvider(isIncome).notifier).state = end;
// }

// final transactionsProvider =
//     AsyncNotifierProvider<TransactionsNotifier, List<Transaction>>(
//       TransactionsNotifier.new,
//       dependencies: [isIncomeProvider],
//     );

// /// Data loader (AsyncNotifier)
// class TransactionsNotifier extends AsyncNotifier<List<Transaction>> {
//   @override
//   FutureOr<List<Transaction>> build() async {
//     final repo = ref.watch(transactionRepositoryProvider);
//     final isIncome = ref.watch(isIncomeProvider);
//     final start = ref.watch(historyStartProvider(isIncome));
//     final end = ref.watch(historyEndProvider(isIncome));

//     final startOfDay = DateTime(start.year, start.month, start.day);
//     final endOfDay = DateTime(
//       end.year,
//       end.month,
//       end.day + 1,
//     ).subtract(Duration(microseconds: 1));

//     final ops = await repo.getTransactionsForPeriod(startOfDay, endOfDay);
//     return ops.where((t) => t.category.isIncome == isIncome).toList();
//   }
// }

// final transactionsByCategoryProvider =
//     Provider<Map<Category, List<Transaction>>>((ref) {
//       final list = ref.watch(transactionsProvider).valueOrNull ?? [];
//       final map = <Category, List<Transaction>>{};
//       for (final t in list) {
//         map.putIfAbsent(t.category, () => []).add(t);
//       }
//       return map;
//     }, dependencies: [transactionsProvider]);
