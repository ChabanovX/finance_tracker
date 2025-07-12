// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(account)
const accountProvider = AccountProvider._();

final class AccountProvider
    extends $FunctionalProvider<AsyncValue<Account>, Account, FutureOr<Account>>
    with $FutureModifier<Account>, $FutureProvider<Account> {
  const AccountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'accountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$accountHash();

  @$internal
  @override
  $FutureProviderElement<Account> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Account> create(Ref ref) {
    return account(ref);
  }
}

String _$accountHash() => r'2a5b46db2ff01376551886bbc4cd7f45ae3302bb';

@ProviderFor(Balance)
const balanceProvider = BalanceProvider._();

final class BalanceProvider extends $NotifierProvider<Balance, BalanceState> {
  const BalanceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'balanceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$balanceHash();

  @$internal
  @override
  Balance create() => Balance();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BalanceState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BalanceState>(value),
    );
  }
}

String _$balanceHash() => r'c01f9317689b4beb6c4c10fa98256d4f20bf937a';

abstract class _$Balance extends $Notifier<BalanceState> {
  BalanceState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<BalanceState, BalanceState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BalanceState, BalanceState>,
              BalanceState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ChartModeState)
const chartModeStateProvider = ChartModeStateProvider._();

final class ChartModeStateProvider
    extends $NotifierProvider<ChartModeState, ChartMode> {
  const ChartModeStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chartModeStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chartModeStateHash();

  @$internal
  @override
  ChartModeState create() => ChartModeState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChartMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChartMode>(value),
    );
  }
}

String _$chartModeStateHash() => r'a1450aeacd9f8e7f53fcd41e653d9a4a71e6b5be';

abstract class _$ChartModeState extends $Notifier<ChartMode> {
  ChartMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ChartMode, ChartMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ChartMode, ChartMode>,
              ChartMode,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Provides 5 months [Transaction]s period.
@ProviderFor(chartTransactions)
const chartTransactionsProvider = ChartTransactionsProvider._();

/// Provides 5 months [Transaction]s period.
final class ChartTransactionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Transaction>>,
          List<Transaction>,
          FutureOr<List<Transaction>>
        >
    with
        $FutureModifier<List<Transaction>>,
        $FutureProvider<List<Transaction>> {
  /// Provides 5 months [Transaction]s period.
  const ChartTransactionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chartTransactionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chartTransactionsHash();

  @$internal
  @override
  $FutureProviderElement<List<Transaction>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Transaction>> create(Ref ref) {
    return chartTransactions(ref);
  }
}

String _$chartTransactionsHash() => r'18c15b85878c6801f6c730693ee48f64ffe130ff';

@ProviderFor(dailyHistory)
const dailyHistoryProvider = DailyHistoryProvider._();

final class DailyHistoryProvider
    extends
        $FunctionalProvider<
          List<HistoryEntry>,
          List<HistoryEntry>,
          List<HistoryEntry>
        >
    with $Provider<List<HistoryEntry>> {
  const DailyHistoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dailyHistoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dailyHistoryHash();

  @$internal
  @override
  $ProviderElement<List<HistoryEntry>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<HistoryEntry> create(Ref ref) {
    return dailyHistory(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<HistoryEntry> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<HistoryEntry>>(value),
    );
  }
}

String _$dailyHistoryHash() => r'f10317f2aa039fd5f98b6472835fb996f47492ca';

@ProviderFor(monthlyHistory)
const monthlyHistoryProvider = MonthlyHistoryProvider._();

final class MonthlyHistoryProvider
    extends
        $FunctionalProvider<
          List<HistoryEntry>,
          List<HistoryEntry>,
          List<HistoryEntry>
        >
    with $Provider<List<HistoryEntry>> {
  const MonthlyHistoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'monthlyHistoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$monthlyHistoryHash();

  @$internal
  @override
  $ProviderElement<List<HistoryEntry>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<HistoryEntry> create(Ref ref) {
    return monthlyHistory(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<HistoryEntry> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<HistoryEntry>>(value),
    );
  }
}

String _$monthlyHistoryHash() => r'2eb1c6c3d2794adae80b55eed0424785a1ad3ccb';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
