import 'dart:math';

import 'package:intl/intl.dart';
import 'package:yndx_homework/features/account/domain/models/account.dart';
import 'package:yndx_homework/features/articles/domain/models/article.dart';
import 'package:yndx_homework/features/transactions/domain/models/transaction.dart';

final _rnd = Random();

final mockCategories = [];

// MOCK ARTICLES
final List<Article> mockArticles = [
  Article(id: 1, text: 'Как накопить на отпуск', emoji: '😂'),
  Article(id: 2, text: 'Инвестиции для начинающих', emoji: '🇷🇺'),
  Article(id: 3, text: 'Экономим на продуктах', emoji: '🥳'),
  Article(id: 4, text: 'Первые шаги в криптовалюте', emoji: '🪙'),
  Article(id: 5, text: 'Как вести семейный бюджет', emoji: '👨‍👩‍👧‍👦'),
  Article(id: 6, text: 'Погашаем кредиты быстрее', emoji: '💳'),
  Article(id: 7, text: 'Выбираем выгодную ипотеку', emoji: '🏠'),
  Article(id: 8, text: 'Финансовая подушка безопасности', emoji: '🛟'),
];

// MOCK ACCOUNT
Account mockAccount = Account(
  id: 0,
  name: 'Main Account',
  balance: 4000.01,
  currency: 'RUB',
);

// MOCK TRANSACTIONS
final List<Transaction> mockTransactions = [
  ...List.generate(10, (i) {
    final category =
        mockCategories[_rnd.nextInt(mockCategories.length)].toDomain();

    // Day 0 = today, Day 29 = 29 days ago (wrap every 30 items)
    // final date = DateTime.now().subtract(Duration(days: i % 30));
    final date = DateTime.now();

    // Roughly every 7-th item is an “income”
    final isIncome = category.isIncome;

    final double amount =
        isIncome
            // 15 000 ≤ amount ≤ 105 000
            ? 15_000 + _rnd.nextDouble() * 90_000
            // –500 ≥ amount ≥ –15 000
            : -(500 + _rnd.nextDouble() * 14_500);

    return Transaction(
      id: 0, // let DB auto-generate real IDs
      account: mockAccount,
      category: category,
      amount: double.parse(amount.toStringAsFixed(2)),
      transactionDate: date,
      comment:
          'Auto tx #${i + 1}  •  '
          '${DateFormat('yyyy-MM-dd').format(date)}',
    );
  }),
];
