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

@ProviderFor(transactionsView)
const transactionsViewProvider = TransactionsViewFamily._();

final class TransactionsViewProvider
    extends
        $FunctionalProvider<
          AsyncValue<TransactionView>,
          AsyncValue<TransactionView>,
          AsyncValue<TransactionView>
        >
    with $Provider<AsyncValue<TransactionView>> {
  const TransactionsViewProvider._({
    required TransactionsViewFamily super.from,
    required ({bool isIncome, DateTime start, DateTime end}) super.argument,
  }) : super(
         retry: null,
         name: r'transactionsViewProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static const $allTransitiveDependencies0 = transactionsForPeriodProvider;
  static const $allTransitiveDependencies1 =
      TransactionsForPeriodProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$transactionsViewHash();

  @override
  String toString() {
    return r'transactionsViewProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<AsyncValue<TransactionView>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<TransactionView> create(Ref ref) {
    final argument =
        this.argument as ({bool isIncome, DateTime start, DateTime end});
    return transactionsView(
      ref,
      isIncome: argument.isIncome,
      start: argument.start,
      end: argument.end,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<TransactionView> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<TransactionView>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TransactionsViewProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$transactionsViewHash() => r'3fcd2ccb386f1c5c0db1cebaf80f2e1d4bc97f0b';

final class TransactionsViewFamily extends $Family
    with
        $FunctionalFamilyOverride<
          AsyncValue<TransactionView>,
          ({bool isIncome, DateTime start, DateTime end})
        > {
  const TransactionsViewFamily._()
    : super(
        retry: null,
        name: r'transactionsViewProvider',
        dependencies: const <ProviderOrFamily>[transactionsForPeriodProvider],
        $allTransitiveDependencies: const <ProviderOrFamily>[
          TransactionsViewProvider.$allTransitiveDependencies0,
          TransactionsViewProvider.$allTransitiveDependencies1,
        ],
        isAutoDispose: true,
      );

  TransactionsViewProvider call({
    required bool isIncome,
    required DateTime start,
    required DateTime end,
  }) => TransactionsViewProvider._(
    argument: (isIncome: isIncome, start: start, end: end),
    from: this,
  );

  @override
  String toString() => r'transactionsViewProvider';
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

@ProviderFor(TransactionsForPeriod)
const transactionsForPeriodProvider = TransactionsForPeriodFamily._();

final class TransactionsForPeriodProvider
    extends $AsyncNotifierProvider<TransactionsForPeriod, List<Transaction>> {
  const TransactionsForPeriodProvider._({
    required TransactionsForPeriodFamily super.from,
    required (DateTime, DateTime) super.argument,
  }) : super(
         retry: null,
         name: r'transactionsForPeriodProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static const $allTransitiveDependencies0 = isIncomeProvider;

  @override
  String debugGetCreateSourceHash() => _$transactionsForPeriodHash();

  @override
  String toString() {
    return r'transactionsForPeriodProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  TransactionsForPeriod create() => TransactionsForPeriod();

  @override
  bool operator ==(Object other) {
    return other is TransactionsForPeriodProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$transactionsForPeriodHash() =>
    r'6e67af7c69fdfeb2b28b0e5ec8b86fba65462ce6';

final class TransactionsForPeriodFamily extends $Family
    with
        $ClassFamilyOverride<
          TransactionsForPeriod,
          AsyncValue<List<Transaction>>,
          List<Transaction>,
          FutureOr<List<Transaction>>,
          (DateTime, DateTime)
        > {
  const TransactionsForPeriodFamily._()
    : super(
        retry: null,
        name: r'transactionsForPeriodProvider',
        dependencies: const <ProviderOrFamily>[isIncomeProvider],
        $allTransitiveDependencies: const <ProviderOrFamily>[
          TransactionsForPeriodProvider.$allTransitiveDependencies0,
        ],
        isAutoDispose: true,
      );

  TransactionsForPeriodProvider call(DateTime start, DateTime end) =>
      TransactionsForPeriodProvider._(argument: (start, end), from: this);

  @override
  String toString() => r'transactionsForPeriodProvider';
}

abstract class _$TransactionsForPeriod
    extends $AsyncNotifier<List<Transaction>> {
  late final _$args = ref.$arg as (DateTime, DateTime);
  DateTime get start => _$args.$1;
  DateTime get end => _$args.$2;

  FutureOr<List<Transaction>> build(DateTime start, DateTime end);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args.$1, _$args.$2);
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
