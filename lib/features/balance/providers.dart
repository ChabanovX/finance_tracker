// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shake/shake.dart';

import 'package:yndx_homework/features/account/domain/models/account.dart';
import 'package:yndx_homework/features/transactions/domain/models/transaction.dart';
import 'package:yndx_homework/shared/providers/repository_providers.dart';

part 'providers.g.dart';

@riverpod
Future<Account> account(Ref ref) async {
  final repo = ref.watch(accountRepositoryProvider);
  return await repo.getAccount();
}

enum Currency { rub, eur, usd }

enum ChartMode { day, month }

class HistoryEntry {
  final DateTime date;
  final double amount;

  HistoryEntry(this.date, this.amount);
}

class BalanceState {
  final double amount;
  final Currency currency;
  final bool visible;

  const BalanceState({
    required this.amount,
    required this.currency,
    required this.visible,
  });

  BalanceState copyWith({double? amount, Currency? currency, bool? visible}) {
    return BalanceState(
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      visible: visible ?? this.visible,
    );
  }
}

@riverpod
class Balance extends _$Balance {
  @override
  BalanceState build() {
    // Initial state.
    final initial = BalanceState(
      amount: 42_420,
      currency: Currency.eur,
      visible: true,
    );

    // optional mobile shake/tilt handling
    if (Platform.isAndroid || Platform.isIOS) {
      _shakeDetector = ShakeDetector.autoStart(
        onPhoneShake: (_) => toggleVisibility(),
      );
      _accelSub = accelerometerEventStream().listen(_handleAccel);
    }

    ref.onDispose(() {
      _shakeDetector?.stopListening;
      _accelSub.cancel();
    });

    return initial;
  }

  void setAmount(double value) => state = state.copyWith(amount: value);

  void setCurrency(Currency cur) => state = state.copyWith(currency: cur);

  void toggleVisibility() => state = state.copyWith(visible: !state.visible);

  late final StreamSubscription<AccelerometerEvent> _accelSub;
  ShakeDetector? _shakeDetector;

  void _handleAccel(AccelerometerEvent e) {
    if (e.z < -6 && state.visible) {
      state = state.copyWith(visible: false);
    } else if (e.z > 6 && !state.visible) {
      state = state.copyWith(visible: true);
    }
  }
}

@riverpod
class ChartModeState extends _$ChartModeState {
  @override
  ChartMode build() {
    return ChartMode.day;
  }

  void set(ChartMode m) => state = m;
}

/// Provides 5 months [Transaction]s period.
@riverpod
Future<List<Transaction>> chartTransactions(Ref ref) async {
  final repo = ref.watch(transactionsRepositoryProvider);
  final accountId = (await ref.watch(accountProvider.future)).id;

  final now = DateTime.now();
  final start = DateTime(now.year, now.month - 5, 1);

  final startDay = DateTime(start.year, start.month, start.day);
  final endDay = DateTime(
    now.year,
    now.month,
    now.day + 1,
  ).subtract(const Duration(microseconds: 1));

  return repo.getTransactionsForPeriod(startDay, endDay, accountId);
}

@riverpod
List<HistoryEntry> dailyHistory(Ref ref) {
  final list = ref.watch(chartTransactionsProvider).value ?? [];
  final now = DateTime.now();
  final start = now.subtract(const Duration(days: 29));

  final map = <DateTime, double>{};
  for (final t in list) {
    final day = DateTime(
      t.transactionDate.year,
      t.transactionDate.month,
      t.transactionDate.day,
    );
    if (day.isBefore(start) || day.isAfter(now)) continue;
    map.update(day, (v) => v + t.amount, ifAbsent: () => t.amount);
  }

  return List.generate(30, (i) {
    final date = DateTime(start.year, start.month, start.day + i);
    return HistoryEntry(date, map[date] ?? 0);
  });
}

@riverpod
List<HistoryEntry> monthlyHistory(Ref ref) {
  final list = ref.watch(chartTransactionsProvider).value ?? [];
  final map = <String, double>{};
  for (final t in list) {
    final key = '${t.transactionDate.year}-${t.transactionDate.month}';
    map.update(key, (v) => v + t.amount, ifAbsent: () => t.amount);
  }
  final entries = <HistoryEntry>[];
  map.forEach((key, val) {
    final parts = key.split('-');
    final year = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    entries.add(HistoryEntry(DateTime(year, month), val));
  });
  entries.sort((a, b) => a.date.compareTo(b.date));
  return entries;
}
