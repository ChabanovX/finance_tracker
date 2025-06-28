part of 'balance_page.dart';

enum _Currency { rub, eur, usd }

class _BalanceController extends ChangeNotifier {
  double _balance = -450_042;
  String _currency = '₽';

  double get balance => _balance;
  String get currency => _currency;

  void setBalance(double value) {
    _balance = value;
    notifyListeners();
  }

  void setCurrency(_Currency cur) {
    switch (cur) {
      case _Currency.rub:
        _currency = '₽';

      case _Currency.eur:
        _currency = '€';

      case _Currency.usd:
        _currency = '\$';
    }
    notifyListeners();
  }
}

/// Dummy provider for local state.
final _balanceProvider = ChangeNotifierProvider<_BalanceController>(
  (_) => _BalanceController(),
);
