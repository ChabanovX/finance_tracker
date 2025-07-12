// part of 'balance_page';

// enum _Currency { rub, eur, usd }

// class _HistoryEntry {
//   final DateTime date;
//   final double amount;

//   _HistoryEntry(this.date, this.amount);
// }

// class _BalanceController extends ChangeNotifier {
//   double _balance = -450_042;
//   String _currency = '₽';
//   bool _visible = true;

//   double get balance => _balance;
//   String get currency => _currency;
//   bool get isVisible => _visible;

//   late final StreamSubscription<AccelerometerEvent> _accelSub;
//   ShakeDetector? _shakeDetector;

//   _BalanceController() {
//     if (Platform.isAndroid || Platform.isIOS) {
//       _shakeDetector = ShakeDetector.autoStart(
//         onPhoneShake: (_) => toggleVisibility,
//       );
//       _accelSub = accelerometerEventStream().listen(_handleAccel);
//     }
//   }

//   void setBalance(double value) {
//     _balance = value;
//     notifyListeners();
//   }

//   void setCurrency(_Currency cur) {
//     switch (cur) {
//       case _Currency.rub:
//         _currency = '₽';

//       case _Currency.eur:
//         _currency = '€';

//       case _Currency.usd:
//         _currency = '\$';
//     }
//     notifyListeners();
//   }

//   void toggleVisibility() {
//     _visible = !_visible;
//     notifyListeners();
//   }

//   void _handleAccel(AccelerometerEvent e) {
//     if (e.z < -6 && _visible) {
//       _visible = false;
//       notifyListeners();
//     } else if (e.z > 6 && !_visible) {
//       _visible = true;
//       notifyListeners();
//     }
//   }

//   @override
//   void dispose() {
//     _shakeDetector?.stopListening();
//     _accelSub.cancel();
//     super.dispose();
//   }
// }

// /// Dummy provider for local state.
// final _balanceProvider = ChangeNotifierProvider<_BalanceController>(
//   (_) => _BalanceController(),
// );

// final _chartModeProvider = StateProvider<_ChartMode>((_) => _ChartMode.day);

// final _chartTransactionsProvider = FutureProvider<List<Transaction>>((ref) async {
//   final repo = ref.watch(transactionRepositoryProvider);
//   final now = DateTime.now();
//   final start = DateTime(now.year, now.month - 5, 1);
//   final startDay = DateTime(start.year, start.month, start.day);
//   final endDay = DateTime(now.year, now.month, now.day + 1)
//       .subtract(const Duration(microseconds: 1));
//   return repo.getTransactionsForPeriod(startDay, endDay);
// });

// final _dailyHistoryProvider = Provider<List<_HistoryEntry>>((ref) {
//   final list = ref.watch(_chartTransactionsProvider).valueOrNull ?? [];
//   final now = DateTime.now();
//   final start = now.subtract(const Duration(days: 29));
//   final map = <DateTime, double>{};
//   for (final t in list) {
//     final day = DateTime(t.transactionDate.year, t.transactionDate.month, t.transactionDate.day);
//     if (day.isBefore(start) || day.isAfter(now)) continue;
//     map.update(day, (v) => v + t.amount, ifAbsent: () => t.amount);
//   }
//   return List.generate(30, (i) {
//     final date = DateTime(start.year, start.month, start.day + i);
//     return _HistoryEntry(date, map[date] ?? 0);
//   });
// });

// final _monthlyHistoryProvider = Provider<List<_HistoryEntry>>((ref) {
//   final list = ref.watch(_chartTransactionsProvider).valueOrNull ?? [];
//   final map = <String, double>{};
//   for (final t in list) {
//     final key = '${t.transactionDate.year}-${t.transactionDate.month}';
//     map.update(key, (v) => v + t.amount, ifAbsent: () => t.amount);
//   }
//   final entries = <_HistoryEntry>[];
//   map.forEach((key, val) {
//     final parts = key.split('-');
//     final year = int.parse(parts[0]);
//     final month = int.parse(parts[1]);
//     entries.add(_HistoryEntry(DateTime(year, month), val));
//   });
//   entries.sort((a, b) => a.date.compareTo(b.date));
//   return entries;
// });
