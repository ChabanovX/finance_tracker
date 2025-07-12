import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yndx_homework/features/transactions/presentation/analysis_page/analysis_page.dart';
import 'package:yndx_homework/features/articles/presentation/articles_page/articles_page.dart';
import 'package:yndx_homework/features/balance/presentation/balance_page/balance_page.dart';
import 'package:yndx_homework/features/transactions/providers.dart';
import 'package:yndx_homework/shared/providers/network_provider.dart';

import '../../features/transactions/presentation/transactions_history_page/transactions_history_page.dart';
import '../../features/transactions/presentation/transactions_page/transactions_page.dart';
import '../theme/app_theme.dart';

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
        onGenerateRoute: (_) => MaterialPageRoute(
          builder: (_) => TransactionsPage(
            isIncome: false,
            onShowHistory: () => key.currentState?.push(
              MaterialPageRoute(
                builder: (_) => TransactionsHistoryPage(
                  isIncome: false,
                  onShowAnalysis: () => key.currentState?.push(
                    MaterialPageRoute(
                      builder: (_) => const AnalysisPage(
                        isIncome: false,
                      ),
                    ),
                  ),
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
        onGenerateRoute: (_) => MaterialPageRoute(
          builder: (_) => TransactionsPage(
            isIncome: true,
            onShowHistory: () => key.currentState?.push(
              MaterialPageRoute(
                builder: (_) => TransactionsHistoryPage(
                  isIncome: true,
                  onShowAnalysis: () => key.currentState?.push(
                    MaterialPageRoute(
                      builder: (_) => const AnalysisPage(
                        isIncome: true,
                      ),
                    ),
                  ),
                ),
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
            colorFilter: _selectedIndex == index
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
            child: _ScaffoldWithOfflineBanner(
              selectedIndex: _selectedIndex,
              tabs: _tabs,
              navigationBar: _buildNavigationBar(context),
            ),
          ),
        ),
      ],
    );
  }
}

// Separate widget for cleaner structure
class _ScaffoldWithOfflineBanner extends ConsumerWidget {
  final int selectedIndex;
  final List<Widget> tabs;
  final Widget navigationBar;

  const _ScaffoldWithOfflineBanner({
    required this.selectedIndex,
    required this.tabs,
    required this.navigationBar,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final networkState = ref.watch(networkStateProvider);

    return Scaffold(
      body: Column(
        children: [
          // Offline banner
          networkState.when(
            data: (isConnected) {
              if (!isConnected) {
                return _buildOfflineBanner();
              }
              return const SizedBox.shrink();
            },
            loading: () => const SizedBox.shrink(),
            error: (e, __) => _buildErrorBanner(e.toString()),
          ),
          // Main content
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: tabs,
            ),
          ),
        ],
      ),
      bottomNavigationBar: navigationBar,
    );
  }

  Widget _buildOfflineBanner() {
    return Container(
      width: double.infinity,
      color: Colors.red,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off,
            color: Colors.white,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            'Режим офлайн',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorBanner(String errMessage) {
    return Container(
      width: double.infinity,
      color: Colors.orange,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning,
            color: Colors.white,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            errMessage,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
