part of 'balance_page.dart';

enum _Currency { rub, eur, usd }

class _BalanceController extends ChangeNotifier {
  double _balance = -450_042;
  String _currency = '₽';
  bool _visible = true;

  double get balance => _balance;
  String get currency => _currency;
  bool get isVisible => _visible;

  late final StreamSubscription<AccelerometerEvent> _accelSub;
  ShakeDetector? _shakeDetector;

  _BalanceController() {
    _shakeDetector = ShakeDetector.autoStart(
      onPhoneShake: (_) => toggleVisibility,
    );
    _accelSub = accelerometerEventStream().listen(_handleAccel);
  }

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

  void toggleVisibility() {
    _visible = !_visible;
    notifyListeners();
  }

  void _handleAccel(AccelerometerEvent e) {
    if (e.z < -6 && _visible) {
      _visible = false;
      notifyListeners();
    } else if (e.z > 6 && !_visible) {
      _visible = true;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _shakeDetector?.stopListening();
    _accelSub.cancel();
    super.dispose();
  }
}

/// Dummy provider for local state.
final _balanceProvider = ChangeNotifierProvider<_BalanceController>(
  (_) => _BalanceController(),
);
