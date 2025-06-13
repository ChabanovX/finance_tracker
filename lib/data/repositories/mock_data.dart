import 'package:yndx_homework/domain/models/account.dart';
import 'package:yndx_homework/domain/models/category.dart';
import 'package:yndx_homework/domain/models/transaction.dart';

// MOCK CATEGORIES
final mockIncomeCategory = Category(
  id: 1,
  name: 'Salary',
  emoji: '🏦',
  isIncome: true,
);
final mockExpenseCategory1 = Category(
  id: 2,
  name: 'Groceries',
  emoji: '🛒',
  isIncome: false,
);
final mockExpenseCategory2 = Category(
  id: 3,
  name: 'Dormitary',
  emoji: '🏠',
  isIncome: false,
);

final List<Category> mockCategories = [
  mockIncomeCategory,
  mockExpenseCategory1,
  mockExpenseCategory2,
];

// MOCK ACCOUNT
Account mockAccount = Account(
  id: 1234,
  name: 'Main Account',
  balance: 4000.01,
  currency: 'RUB',
);

// MOCK TRANSACTIONS
final List<Transaction> mockTransactions = [
  Transaction(
    id: 1001,
    account: mockAccount,
    category: mockIncomeCategory,
    amount: 80000.00,
    transactionDate: DateTime.now().subtract(const Duration(days: 5)),
    comment: 'Monthly salary',
  ),
  Transaction(
    id: 1002,
    account: mockAccount,
    category: mockExpenseCategory1,
    amount: -2550.75,
    transactionDate: DateTime.now().subtract(const Duration(days: 2)),
    comment: 'Weekly groceries',
  ),
  Transaction(
    id: 1003,
    account: mockAccount,
    category: mockExpenseCategory2,
    amount: -6499.00,
    transactionDate: DateTime.now().subtract(const Duration(days: 1)),
    comment: 'Dorm payment',
  ),
];
