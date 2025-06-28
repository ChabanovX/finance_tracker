import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yndx_homework/presentation/pages/articles_page/articles_page.dart';
import 'package:yndx_homework/presentation/pages/balance_page/balance_page.dart';

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
  AppRouterDelegate() {
    _tabs = [
      _buildExpensesNavigator(),
      _buildIncomesNavigator(),
      _simpleNavigator(const BalancePage(), 2),
      _simpleNavigator(const ArticlesPage(), 3),
      _simpleNavigator(const Center(child: Text('Настройки')), 4),
    ];
  }

  /// Navigators used in the [IndexedStack]. They are created once in the
  /// constructor so their state is preserved.
  late final List<Widget> _tabs;

  /// Root navigator key.
  final GlobalKey<NavigatorState> _rootKey = GlobalKey<NavigatorState>();

  /// Keys for each tab navigator.
  final List<GlobalKey<NavigatorState>> _navigatorKeys = List.generate(
    5,
    (_) => GlobalKey<NavigatorState>(),
  );

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _rootKey;

  /// Currently selected bottom navigation bar.
  int _selectedIndex = 0;

  Widget _simpleNavigator(Widget child, int index) {
    final key = _navigatorKeys[index];
    return Navigator(
      key: key,
      onGenerateRoute: (_) => MaterialPageRoute(builder: (_) => child),
    );
  }

  Widget _buildExpensesNavigator() {
    final key = _navigatorKeys[0];
    return ProviderScope(
      overrides: [isIncomeProvider.overrideWithValue(false)],
      child: Navigator(
        key: key,
        onGenerateRoute:
            (_) => MaterialPageRoute(
              builder:
                  (_) => TransactionsPage(
                    isIncome: false,
                    onShowHistory:
                        () => key.currentState?.push(
                          MaterialPageRoute(
                            builder:
                                (_) => const TransactionsHistoryPage(
                                  isIncome: false,
                                ),
                          ),
                        ),
                  ),
            ),
      ),
    );
  }

  Widget _buildIncomesNavigator() {
    final key = _navigatorKeys[1];
    return ProviderScope(
      overrides: [isIncomeProvider.overrideWithValue(true)],
      child: Navigator(
        key: key,
        onGenerateRoute:
            (_) => MaterialPageRoute(
              builder:
                  (_) => TransactionsPage(
                    isIncome: true,
                    onShowHistory:
                        () => key.currentState?.push(
                          MaterialPageRoute(
                            builder:
                                (_) =>
                                    const TransactionsHistoryPage(isIncome: true),
                          ),
                        ),
                  ),
            ),
      ),
    );
  }

  @override
  Future<void> setNewRoutePath(int configuration) async {
    _selectedIndex = configuration;
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
    return Navigator(
      onDidRemovePage: (_) {},
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('root_scaffold'),
          child: SafeArea(
            top: false,
            child: Scaffold(
              body: IndexedStack(index: _selectedIndex, children: _tabs),
              bottomNavigationBar: _buildNavigationBar(context),
            ),
          ),
        ),
      ],
    );
  }
}
