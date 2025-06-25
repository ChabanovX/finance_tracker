import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/presentation/pages/transactions_history_page/transactions_history_page.dart';
import '/presentation/pages/transactions_page/transactions_page.dart';
import '/presentation/theme/app_theme.dart';
import '/presentation/providers.dart' show isIncomeProvider;

/// Shortcut for [NavigationDestination].
class _NavigationItem {
  final String iconAsset;
  final String label;

  const _NavigationItem({required this.iconAsset, required this.label});
}

class AppRouterDelegate extends RouterDelegate<int>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<int> {
  AppRouterDelegate();

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  int _selectedIndex = 0;

  bool _showExpensesHistory = false;

  bool _showIncomesHistory = false;

  @override
  Future<void> setNewRoutePath(int configuration) async {
    _selectedIndex = configuration;
  }

  /// Build pages to use in [Navigator].
  List<Page> _buildPages() {
    switch (_selectedIndex) {
      case 0:
        final pages = <Page>[
          MaterialPage(
            key: const ValueKey('expenses'),
            child: TransactionsPage(
              isIncome: false,
              onShowHistory: () {
                _showExpensesHistory = true;
                notifyListeners();
              },
            ),
          ),
        ];
        // Show history if pressed
        if (_showIncomesHistory) {
          pages.add(
            MaterialPage(
              key: const ValueKey('expenses_history'),
              child: ProviderScope(
                overrides: [isIncomeProvider.overrideWithValue(false)],
                child: TransactionsHistoryPage(isIncome: false),
              ),
            ),
          );
        }
        return pages;

      case 1:
        final pages = <Page>[
          MaterialPage(
            key: const ValueKey('incomes'),
            child: TransactionsPage(
              isIncome: true,
              onShowHistory: () {
                _showIncomesHistory = true;
                notifyListeners();
              },
            ),
          ),
        ];
        // Show history if pressed
        if (_showIncomesHistory) {
          pages.add(
            MaterialPage(
              key: const ValueKey('incomes_history'),
              child: ProviderScope(
                overrides: [isIncomeProvider.overrideWithValue(true)],
                child: TransactionsHistoryPage(isIncome: true),
              ),
            ),
          );
        }
        return pages;

      case 2:
        return [
          const MaterialPage(
            key: ValueKey('account'),
            child: Center(child: Text('Счет')),
          ),
        ];

      case 3:
        return [
          const MaterialPage(
            key: ValueKey('articles'),
            child: Center(child: Text('Статьи')),
          ),
        ];

      case 4:
      default:
        return [
          const MaterialPage(
            key: ValueKey('settings'),
            child: Center(child: Text('Settings')),
          ),
        ];
    }
  }

  /// Shortcut labels for [NavigationDestination].
  static const List<_NavigationItem> _navItems = [
    _NavigationItem(iconAsset: 'assets/icons/expenses.svg', label: 'Расходы'),
    _NavigationItem(iconAsset: 'assets/icons/incomes.svg', label: 'Доходы'),
    _NavigationItem(iconAsset: 'assets/icons/account.svg', label: 'Счет'),
    _NavigationItem(iconAsset: 'assets/icons/articles.svg', label: 'Статьи'),
    _NavigationItem(iconAsset: 'assets/icons/settings.svg', label: 'Настройки'),
  ];

  /// Build [NavigationBar] shortcut for [Scaffold].
  Widget _buildNavigationBar(BuildContext context) {
    return NavigationBar(
      selectedIndex: _selectedIndex,
      onDestinationSelected: _onItemTapped,
      destinations: List.generate(_navItems.length, (int index) {
        final _NavigationItem item = _navItems[index];

        return NavigationDestination(
          label: item.label,
          icon: SvgPicture.asset(
            item.iconAsset,
            width: 24,
            height: 24,
            colorFilter:
                _selectedIndex == index
                    ? null
                    : ColorFilter.mode(
                      context.colors.inactive,
                      BlendMode.srcIn,
                    ),
          ),
        );
      }),
    );
  }

  /// Listeners notifier.
  void _onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Navigator(
          key: navigatorKey,
          pages: _buildPages(),
          onDidRemovePage: (_) {
            if (_showExpensesHistory) {
              _showExpensesHistory = false;
            } else if (_showIncomesHistory) {
              _showIncomesHistory = false;
            }
            notifyListeners();
          },
        ),
        bottomNavigationBar: _buildNavigationBar(context),
      ),
    );
  }
}
