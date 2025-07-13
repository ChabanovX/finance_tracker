// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(SortBy)
const sortByProvider = SortByProvider._();

final class SortByProvider extends $NotifierProvider<SortBy, SortByEnum> {
  const SortByProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sortByProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sortByHash();

  @$internal
  @override
  SortBy create() => SortBy();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SortByEnum value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SortByEnum>(value),
    );
  }
}

String _$sortByHash() => r'1b13b5fcdf6d44663e9bb69b546e2920e9fb0447';

abstract class _$SortBy extends $Notifier<SortByEnum> {
  SortByEnum build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SortByEnum, SortByEnum>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SortByEnum, SortByEnum>,
              SortByEnum,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(isIncome)
const isIncomeProvider = IsIncomeProvider._();

final class IsIncomeProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  const IsIncomeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isIncomeProvider',
        isAutoDispose: true,
        dependencies: const <ProviderOrFamily>[],
        $allTransitiveDependencies: const <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$isIncomeHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isIncome(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isIncomeHash() => r'15ec86afe82085f4acb201662245a5955d4c1268';

@ProviderFor(category)
const categoryProvider = CategoryProvider._();

final class CategoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Category>>,
          List<Category>,
          FutureOr<List<Category>>
        >
    with $FutureModifier<List<Category>>, $FutureProvider<List<Category>> {
  const CategoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoryHash();

  @$internal
  @override
  $FutureProviderElement<List<Category>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Category>> create(Ref ref) {
    return category(ref);
  }
}

String _$categoryHash() => r'5be9f1cae5d545ceaa4dc3d312e355faacc0d3d0';

@ProviderFor(totalAmount)
const totalAmountProvider = TotalAmountProvider._();

final class TotalAmountProvider
    extends $FunctionalProvider<double, double, double>
    with $Provider<double> {
  const TotalAmountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'totalAmountProvider',
        isAutoDispose: true,
        dependencies: const <ProviderOrFamily>[
          isIncomeProvider,
          sortedTransactionsProvider,
        ],
        $allTransitiveDependencies: const <ProviderOrFamily>[
          TotalAmountProvider.$allTransitiveDependencies0,
          TotalAmountProvider.$allTransitiveDependencies1,
          TotalAmountProvider.$allTransitiveDependencies2,
        ],
      );

  static const $allTransitiveDependencies0 = isIncomeProvider;
  static const $allTransitiveDependencies1 = sortedTransactionsProvider;
  static const $allTransitiveDependencies2 =
      SortedTransactionsProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$totalAmountHash();

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    return totalAmount(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$totalAmountHash() => r'490d62816f5f4237cef7d6d6feb496c2cd20bd97';

@ProviderFor(txByCategory)
const txByCategoryProvider = TxByCategoryProvider._();

final class TxByCategoryProvider
    extends
        $FunctionalProvider<
          Map<Category, List<Transaction>>,
          Map<Category, List<Transaction>>,
          Map<Category, List<Transaction>>
        >
    with $Provider<Map<Category, List<Transaction>>> {
  const TxByCategoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'txByCategoryProvider',
        isAutoDispose: true,
        dependencies: const <ProviderOrFamily>[transactionsProvider],
        $allTransitiveDependencies: const <ProviderOrFamily>[
          TxByCategoryProvider.$allTransitiveDependencies0,
          TxByCategoryProvider.$allTransitiveDependencies1,
        ],
      );

  static const $allTransitiveDependencies0 = transactionsProvider;
  static const $allTransitiveDependencies1 =
      TransactionsProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$txByCategoryHash();

  @$internal
  @override
  $ProviderElement<Map<Category, List<Transaction>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<Category, List<Transaction>> create(Ref ref) {
    return txByCategory(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<Category, List<Transaction>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<Category, List<Transaction>>>(
        value,
      ),
    );
  }
}

String _$txByCategoryHash() => r'6cf10c5d2769ccb195d1ec82bb30e559cbd0302a';

@ProviderFor(sortedTransactions)
const sortedTransactionsProvider = SortedTransactionsFamily._();

final class SortedTransactionsProvider
    extends
        $FunctionalProvider<
          List<Transaction>,
          List<Transaction>,
          List<Transaction>
        >
    with $Provider<List<Transaction>> {
  const SortedTransactionsProvider._({
    required SortedTransactionsFamily super.from,
    required bool super.argument,
  }) : super(
         retry: null,
         name: r'sortedTransactionsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static const $allTransitiveDependencies0 = transactionsProvider;
  static const $allTransitiveDependencies1 =
      TransactionsProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$sortedTransactionsHash();

  @override
  String toString() {
    return r'sortedTransactionsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<Transaction>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<Transaction> create(Ref ref) {
    final argument = this.argument as bool;
    return sortedTransactions(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Transaction> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Transaction>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SortedTransactionsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sortedTransactionsHash() =>
    r'70a61dfb17f27744a97fa14e6d82de1de2a000bd';

final class SortedTransactionsFamily extends $Family
    with $FunctionalFamilyOverride<List<Transaction>, bool> {
  const SortedTransactionsFamily._()
    : super(
        retry: null,
        name: r'sortedTransactionsProvider',
        dependencies: const <ProviderOrFamily>[transactionsProvider],
        $allTransitiveDependencies: const <ProviderOrFamily>[
          SortedTransactionsProvider.$allTransitiveDependencies0,
          SortedTransactionsProvider.$allTransitiveDependencies1,
        ],
        isAutoDispose: true,
      );

  SortedTransactionsProvider call(bool isIncome) =>
      SortedTransactionsProvider._(argument: isIncome, from: this);

  @override
  String toString() => r'sortedTransactionsProvider';
}

@ProviderFor(TxRange)
const txRangeProvider = TxRangeFamily._();

final class TxRangeProvider extends $NotifierProvider<TxRange, DateRange> {
  const TxRangeProvider._({
    required TxRangeFamily super.from,
    required bool super.argument,
  }) : super(
         retry: null,
         name: r'txRangeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$txRangeHash();

  @override
  String toString() {
    return r'txRangeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TxRange create() => TxRange();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateRange value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateRange>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TxRangeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$txRangeHash() => r'c87a9d462f968e7cdaeb0eeca9ab865052439778';

final class TxRangeFamily extends $Family
    with $ClassFamilyOverride<TxRange, DateRange, DateRange, DateRange, bool> {
  const TxRangeFamily._()
    : super(
        retry: null,
        name: r'txRangeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TxRangeProvider call(bool isIncome) =>
      TxRangeProvider._(argument: isIncome, from: this);

  @override
  String toString() => r'txRangeProvider';
}

abstract class _$TxRange extends $Notifier<DateRange> {
  late final _$args = ref.$arg as bool;
  bool get isIncome => _$args;

  DateRange build(bool isIncome);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<DateRange, DateRange>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DateRange, DateRange>,
              DateRange,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(HistoryStart)
const historyStartProvider = HistoryStartFamily._();

final class HistoryStartProvider
    extends $NotifierProvider<HistoryStart, DateTime> {
  const HistoryStartProvider._({
    required HistoryStartFamily super.from,
    required bool super.argument,
  }) : super(
         retry: null,
         name: r'historyStartProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$historyStartHash();

  @override
  String toString() {
    return r'historyStartProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  HistoryStart create() => HistoryStart();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is HistoryStartProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$historyStartHash() => r'4e3f80a33436811d677317076e329b6d7bcac76f';

final class HistoryStartFamily extends $Family
    with
        $ClassFamilyOverride<HistoryStart, DateTime, DateTime, DateTime, bool> {
  const HistoryStartFamily._()
    : super(
        retry: null,
        name: r'historyStartProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  HistoryStartProvider call(bool isIncome) =>
      HistoryStartProvider._(argument: isIncome, from: this);

  @override
  String toString() => r'historyStartProvider';
}

abstract class _$HistoryStart extends $Notifier<DateTime> {
  late final _$args = ref.$arg as bool;
  bool get isIncome => _$args;

  DateTime build(bool isIncome);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<DateTime, DateTime>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DateTime, DateTime>,
              DateTime,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(HistoryEnd)
const historyEndProvider = HistoryEndFamily._();

final class HistoryEndProvider extends $NotifierProvider<HistoryEnd, DateTime> {
  const HistoryEndProvider._({
    required HistoryEndFamily super.from,
    required bool super.argument,
  }) : super(
         retry: null,
         name: r'historyEndProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$historyEndHash();

  @override
  String toString() {
    return r'historyEndProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  HistoryEnd create() => HistoryEnd();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is HistoryEndProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$historyEndHash() => r'd9cb94d9360ba15141b36c97815bbe795c8c6dba';

final class HistoryEndFamily extends $Family
    with $ClassFamilyOverride<HistoryEnd, DateTime, DateTime, DateTime, bool> {
  const HistoryEndFamily._()
    : super(
        retry: null,
        name: r'historyEndProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  HistoryEndProvider call(bool isIncome) =>
      HistoryEndProvider._(argument: isIncome, from: this);

  @override
  String toString() => r'historyEndProvider';
}

abstract class _$HistoryEnd extends $Notifier<DateTime> {
  late final _$args = ref.$arg as bool;
  bool get isIncome => _$args;

  DateTime build(bool isIncome);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<DateTime, DateTime>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DateTime, DateTime>,
              DateTime,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(Transactions)
const transactionsProvider = TransactionsProvider._();

final class TransactionsProvider
    extends $AsyncNotifierProvider<Transactions, List<Transaction>> {
  const TransactionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionsProvider',
        isAutoDispose: true,
        dependencies: const <ProviderOrFamily>[isIncomeProvider],
        $allTransitiveDependencies: const <ProviderOrFamily>[
          TransactionsProvider.$allTransitiveDependencies0,
        ],
      );

  static const $allTransitiveDependencies0 = isIncomeProvider;

  @override
  String debugGetCreateSourceHash() => _$transactionsHash();

  @$internal
  @override
  Transactions create() => Transactions();
}

String _$transactionsHash() => r'35c555b1959deee82b395ff07c30a3586775dc9f';

abstract class _$Transactions extends $AsyncNotifier<List<Transaction>> {
  FutureOr<List<Transaction>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<Transaction>>, List<Transaction>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Transaction>>, List<Transaction>>,
              AsyncValue<List<Transaction>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
