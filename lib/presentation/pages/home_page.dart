import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yndx_homework/presentation/pages/transactions_page/transactions_page.dart';
import 'package:yndx_homework/presentation/theme/app_theme.dart';

class _NavigationItem {
  final String iconAsset;
  final String label;

  const _NavigationItem({required this.iconAsset, required this.label});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = [
    TransactionsPage(isIncome: false),
    TransactionsPage(isIncome: true),
    Center(child: Text('Счет')),
    Center(child: Text('Статьи')),
    Center(child: Text('Настройки')),
  ];

  static const List<_NavigationItem> _navItems = [
    _NavigationItem(iconAsset: 'assets/icons/expenses.svg', label: 'Расходы'),
    _NavigationItem(iconAsset: 'assets/icons/incomes.svg', label: 'Доходы'),
    _NavigationItem(iconAsset: 'assets/icons/account.svg', label: 'Счет'),
    _NavigationItem(iconAsset: 'assets/icons/articles.svg', label: 'Статьи'),
    _NavigationItem(iconAsset: 'assets/icons/settings.svg', label: 'Настройки'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: _onItemTapped,
          selectedIndex: _selectedIndex,
          destinations: List.generate(_navItems.length, (int index) {
            final _NavigationItem item = _navItems[index];

            return NavigationDestination(
              label: item.label,
              icon: SvgPicture.asset(
                item.iconAsset,
                width: 24,
                height: 24,
                colorFilter: _getFilterForItem(_selectedIndex == index),
              ),
            );
          }),
        ),
      ),
    );
  }

  ColorFilter? _getFilterForItem(bool isSelected) {
    return isSelected
        ? null
        : ColorFilter.mode(context.colors.inactive, BlendMode.srcIn);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
