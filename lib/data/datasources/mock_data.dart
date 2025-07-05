import 'dart:math';

import 'package:intl/intl.dart';
import 'package:yndx_homework/domain/models/account.dart';
import 'package:yndx_homework/domain/models/article.dart';
import 'package:yndx_homework/domain/models/category.dart';
import 'package:yndx_homework/domain/models/transaction.dart';

// ─────────────────────────────────────────────────────────────────────────────
//  All mock objects start with id = 0 so that ObjectBox assigns real IDs.
// ─────────────────────────────────────────────────────────────────────────────

final _rnd = Random();

// MOCK INCOME CATEGORIES
final mockSalaryCategory = Category(
  id: 0,
  name: 'Salary',
  emoji: '🏦',
  isIncome: true,
);
final mockFreelanceCategory = Category(
  id: 0,
  name: 'Freelance',
  emoji: '💻',
  isIncome: true,
);
final mockInvestmentCategory = Category(
  id: 0,
  name: 'Investments',
  emoji: '📈',
  isIncome: true,
);
final mockGiftCategory = Category(
  id: 0,
  name: 'Gifts',
  emoji: '🎁',
  isIncome: true,
);

// MOCK EXPENSE CATEGORIES
final mockGroceriesCategory = Category(
  id: 0,
  name: 'Groceries',
  emoji: '🛒',
  isIncome: false,
);
final mockHousingCategory = Category(
  id: 0,
  name: 'Housing',
  emoji: '🏠',
  isIncome: false,
);
final mockTransportCategory = Category(
  id: 0,
  name: 'Transport',
  emoji: '🚗',
  isIncome: false,
);
final mockFoodCategory = Category(
  id: 0,
  name: 'Dining Out',
  emoji: '🍽️',
  isIncome: false,
);
final mockEntertainmentCategory = Category(
  id: 0,
  name: 'Entertainment',
  emoji: '🎬',
  isIncome: false,
);
final mockHealthcareCategory = Category(
  id: 0,
  name: 'Healthcare',
  emoji: '🏥',
  isIncome: false,
);
final mockShoppingCategory = Category(
  id: 0,
  name: 'Shopping',
  emoji: '🛍️',
  isIncome: false,
);
final mockEducationCategory = Category(
  id: 0,
  name: 'Education',
  emoji: '📚',
  isIncome: false,
);
final mockUtilitiesCategory = Category(
  id: 0,
  name: 'Utilities',
  emoji: '⚡',
  isIncome: false,
);
final mockSubscriptionsCategory = Category(
  id: 0,
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
  Article(
    id: 1,
    text: 'Как накопить на отпуск',
    emoji: '😂',
  ),
  Article(
    id: 2,
    text: 'Инвестиции для начинающих',
    emoji: '🇷🇺',
  ),
  Article(
    id: 3,
    text: 'Экономим на продуктах',
    emoji: '🥳',
  ),
  Article(
    id: 4,
    text: 'Первые шаги в криптовалюте',
    emoji: '🪙',
  ),
  Article(
    id: 5,
    text: 'Как вести семейный бюджет',
    emoji: '👨‍👩‍👧‍👦',
  ),
  Article(
    id: 6,
    text: 'Погашаем кредиты быстрее',
    emoji: '💳',
  ),
  Article(
    id: 7,
    text: 'Выбираем выгодную ипотеку',
    emoji: '🏠',
  ),
  Article(
    id: 8,
    text: 'Финансовая подушка безопасности',
    emoji: '🛟',
  ),
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
  // Income transactions
  Transaction(
    id: 0,
    account: mockAccount,
    category: mockSalaryCategory,
    amount: 80000.00,
    transactionDate: DateTime.now(),
    comment: null,
  ),
  Transaction(
    id: 0,
    account: mockAccount,
    category: mockFreelanceCategory,
    amount: 25000.00,
    transactionDate: DateTime.now(),
    comment: 'Website development project',
  ),
  Transaction(
    id: 0,
    account: mockAccount,
    category: mockInvestmentCategory,
    amount: 3500.50,
    transactionDate: DateTime.now(),
    comment: null,
  ),
  Transaction(
    id: 0,
    account: mockAccount,
    category: mockGiftCategory,
    amount: 5000.00,
    transactionDate: DateTime.now(),
    comment: 'Birthday gift from parents',
  ),
  
  // Expense transactions
  Transaction(
    id: 0,
    account: mockAccount,
    category: mockGroceriesCategory,
    amount: -2550.75,
    transactionDate: DateTime.now(),
    comment: null,
  ),
  Transaction(
    id: 0,
    account: mockAccount,
    category: mockGroceriesCategory,
    amount: -140.10,
    transactionDate: DateTime.now(),
    comment: 'Forgot some',
  ),
  Transaction(
    id: 0,
    account: mockAccount,
    category: mockHousingCategory,
    amount: -18000.00,
    transactionDate: DateTime.now(),
    comment: 'Monthly rent payment',
  ),
  Transaction(
    id: 0,
    account: mockAccount,
    category: mockTransportCategory,
    amount: -1200.00,
    transactionDate: DateTime.now(),
    comment: null,
  ),
  Transaction(
    id: 0,
    account: mockAccount,
    category: mockFoodCategory,
    amount: -850.00,
    transactionDate: DateTime.now(),
    comment: null,
  ),
  Transaction(
    id: 0,
    account: mockAccount,
    category: mockEntertainmentCategory,
    amount: -1500.00,
    transactionDate: DateTime.now(),
    comment: 'Cinema tickets and popcorn',
  ),
  Transaction(
    id: 0,
    account: mockAccount,
    category: mockHealthcareCategory,
    amount: -3200.00,
    transactionDate: DateTime.now(),
    comment: 'Dental checkup',
  ),
  Transaction(
    id: 0,
    account: mockAccount,
    category: mockShoppingCategory,
    amount: -4500.00,
    transactionDate: DateTime.now(),
    comment: 'New winter clothes',
  ),
  Transaction(
    id: 0,
    account: mockAccount,
    category: mockEducationCategory,
    amount: -12000.00,
    transactionDate: DateTime.now(),
    comment: 'Online course subscription',
  ),
  Transaction(
    id: 0,
    account: mockAccount,
    category: mockUtilitiesCategory,
    amount: -3500.00,
    transactionDate: DateTime.now(),
    comment: 'Electricity and gas bill',
  ),
  Transaction(
    id: 0,
    account: mockAccount,
    category: mockSubscriptionsCategory,
    amount: -599.00,
    transactionDate: DateTime.now(),
    comment: 'Netflix monthly subscription',
  ),
  Transaction(
    id: 0,
    account: mockAccount,
    category: mockGroceriesCategory,
    amount: -1820.50,
    transactionDate: DateTime.now(),
    comment: 'Quick grocery run',
  ),
  Transaction(
    id: 0,
    account: mockAccount,
    category: mockTransportCategory,
    amount: -450.00,
    transactionDate: DateTime.now(),
    comment: 'Taxi ride',
  ),
  Transaction(
    id: 0,
    account: mockAccount,
    category: mockFoodCategory,
    amount: -320.00,
    transactionDate: DateTime.now(),
    comment: 'Coffee and pastry',
  ),
  Transaction(
    id: 0,
    account: mockAccount,
    category: mockShoppingCategory,
    amount: -2100.00,
    transactionDate: DateTime.now(),
    comment: 'Phone accessories',
  ),
  Transaction(
    id: 0,
    account: mockAccount,
    category: mockEntertainmentCategory,
    amount: -800.00,
    transactionDate: DateTime.now(),
    comment: 'Gaming subscription',
  ),
  ...List.generate(180, (i) {
    // Day 0 = today, Day 29 = 29 days ago (wrap every 30 items)
    final date = DateTime.now().subtract(Duration(days: i % 30));

    // Roughly every 7-th item is an “income”
    final isIncome = i % 7 == 0;

    final double amount = isIncome
        // 15 000 ≤ amount ≤ 105 000
        ? 15_000 + _rnd.nextDouble() * 90_000
        // –500 ≥ amount ≥ –15 000
        : -(500 + _rnd.nextDouble() * 14_500);

    final category = mockCategories[_rnd.nextInt(mockCategories.length)];

    return Transaction(
      id: 0, // let DB auto-generate real IDs
      account: mockAccount,
      category: category,
      amount: double.parse(amount.toStringAsFixed(2)),
      transactionDate: date,
      comment: 'Auto tx #${i + 1}  •  '
          '${DateFormat('yyyy-MM-dd').format(date)}',
    );
  }),
];
