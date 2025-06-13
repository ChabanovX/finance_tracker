import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const _appBarBackgroundColor = Color(0xFF2AE881);
  static const _inactiveColor = Color(0xFF49454F);
  static const _indicatorBackgroundColor = Color(0xFFD4FAE6);

  static const List<Widget> _widgetOptions = [
    Center(child: Text('Расходы')),
    Center(child: Text('Доходы')),
    Center(child: Text('Счет')),
    Center(child: Text('Статьи')),
    Center(child: Text('Настройки')),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Мои Финансы'),
          backgroundColor: _appBarBackgroundColor,
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: _onItemTapped,
          selectedIndex: _selectedIndex,
          indicatorColor: _indicatorBackgroundColor,
          destinations: [
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/expenses.svg',
                width: 24,
                height: 24,
                colorFilter: _selectedIndex == 0 ? null : ColorFilter.mode(_inactiveColor, BlendMode.srcIn),
              ),
              label: 'Расходы',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/incomes.svg',
                width: 24,
                height: 24,
                colorFilter: _selectedIndex == 1 ? null : ColorFilter.mode(_inactiveColor, BlendMode.srcIn),
              ),
              label: 'Доходы',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/account.svg',
                width: 24,
                height: 24,
                colorFilter: _selectedIndex == 2 ? null : ColorFilter.mode(_inactiveColor, BlendMode.srcIn),
              ),
              label: 'Счет',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/articles.svg',
                width: 24,
                height: 24,
                colorFilter: _selectedIndex == 3 ? null : ColorFilter.mode(_inactiveColor, BlendMode.srcIn),
              ),
              label: 'Статьи',
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/icons/settings.svg',
                width: 24,
                height: 24,
                colorFilter: _selectedIndex == 4 ? null : ColorFilter.mode(_inactiveColor, BlendMode.srcIn),
              ),
              label: 'Настройки',
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
