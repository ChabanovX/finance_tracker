import 'dart:math';

import 'package:intl/intl.dart';
import 'package:yndx_homework/features/account/domain/models/account.dart';
import 'package:yndx_homework/features/articles/domain/models/article.dart';
import 'package:yndx_homework/features/transactions/domain/models/category.dart';
import 'package:yndx_homework/features/transactions/domain/models/transaction.dart';

final _rnd = Random();


final mockSalaryCategory = Category(
  id: 1,
  name: 'Salary',
  emoji: '🏦',
  isIncome: true,
);
final mockFreelanceCategory = Category(
  id: 2,
  name: 'Freelance',
  emoji: '💻',
  isIncome: true,
);
final mockInvestmentCategory = Category(
  id: 3,
  name: 'Investments',
  emoji: '📈',
  isIncome: true,
);
final mockGiftCategory = Category(
  id: 4,
  name: 'Gifts',
  emoji: '🎁',
  isIncome: true,
);

// MOCK EXPENSE CATEGORIES
final mockGroceriesCategory = Category(
  id: 5,
  name: 'Groceries',
  emoji: '🛒',
  isIncome: false,
);
final mockHousingCategory = Category(
  id: 6,
  name: 'Housing',
  emoji: '🏠',
  isIncome: false,
);
final mockTransportCategory = Category(
  id: 7,
  name: 'Transport',
  emoji: '🚗',
  isIncome: false,
);
final mockFoodCategory = Category(
  id: 8,
  name: 'Dining Out',
  emoji: '🍽️',
  isIncome: false,
);
final mockEntertainmentCategory = Category(
  id: 9,
  name: 'Entertainment',
  emoji: '🎬',
  isIncome: false,
);
final mockHealthcareCategory = Category(
  id: 10,
  name: 'Healthcare',
  emoji: '🏥',
  isIncome: false,
);
final mockShoppingCategory = Category(
  id: 11,
  name: 'Shopping',
  emoji: '🛍️',
  isIncome: false,
);
final mockEducationCategory = Category(
  id: 12,
  name: 'Education',
  emoji: '📚',
  isIncome: false,
);
final mockUtilitiesCategory = Category(
  id: 13,
  name: 'Utilities',
  emoji: '⚡',
  isIncome: false,
);
final mockSubscriptionsCategory = Category(
  id: 14,
  name: 'Subscriptions',
  emoji: '📱',
  isIncome: false,
);

final List<Category> mockCategories = [
  // Income categories
  mockSalaryCategory,
  mockFreelanceCategory,
  mockInvestmentCategory,
  mockGiftCategory,
  // Expense categories
  mockGroceriesCategory,
  mockHousingCategory,
  mockTransportCategory,
  mockFoodCategory,
  mockEntertainmentCategory,
  mockHealthcareCategory,
  mockShoppingCategory,
  mockEducationCategory,
  mockUtilitiesCategory,
  mockSubscriptionsCategory,
];

// MOCK ARTICLES
final List<Article> mockArticles = [
  Article(id: 1, text: 'How to Save for a Vacation', emoji: '😂'),
  Article(id: 2, text: 'Investing for Beginners', emoji: '✅'),
  Article(id: 3, text: 'Saving on Groceries', emoji: '🥳'),
  Article(id: 4, text: 'First Steps in Cryptocurrency', emoji: '🪙'),
  Article(id: 5, text: 'How to Manage a Family Budget', emoji: '👨‍👩‍👧‍👦'),
  Article(id: 6, text: 'Paying Off Loans Faster', emoji: '💳'),
  Article(id: 7, text: 'Choosing the Best Mortgage Deal', emoji: '🏠'),
  Article(id: 8, text: 'Financial Safety Cushion', emoji: '🛟'),
];

// MOCK ACCOUNT
Account mockAccount = Account(
  id: 0,
  name: 'Main Account',
  balance: 4000.01,
  currency: 'RUB',
);

// MOCK TRANSACTIONS
// final List<Transaction> mockTransactions = [
//   ...List.generate(10, (i) {
//     final category =
//         mockCategories[_rnd.nextInt(mockCategories.length)].toDomain();

//     // Day 0 = today, Day 29 = 29 days ago (wrap every 30 items)
//     // final date = DateTime.now().subtract(Duration(days: i % 30));
//     final date = DateTime.now();

//     // Roughly every 7-th item is an “income”
//     final isIncome = category.isIncome;

//     final double amount =
//         isIncome
//             // 15 000 ≤ amount ≤ 105 000
//             ? 15_000 + _rnd.nextDouble() * 90_000
//             // –500 ≥ amount ≥ –15 000
//             : -(500 + _rnd.nextDouble() * 14_500);

//     return Transaction(
//       id: 0, // let DB auto-generate real IDs
//       account: mockAccount,
//       category: category,
//       amount: double.parse(amount.toStringAsFixed(2)),
//       transactionDate: date,
//       comment:
//           'Auto tx #${i + 1}  •  '
//           '${DateFormat('yyyy-MM-dd').format(date)}',
//     );
//   }),
// ];
