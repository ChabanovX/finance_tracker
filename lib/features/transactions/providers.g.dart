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
    extends $FunctionalProvider<AsyncValue<double>, double, FutureOr<double>>
    with $FutureModifier<double>, $FutureProvider<double> {
  const TotalAmountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'totalAmountProvider',
        isAutoDispose: true,
        dependencies: const <ProviderOrFamily>[
          isIncomeProvider,
          transactionsForPeriodProvider,
        ],
        $allTransitiveDependencies: const <ProviderOrFamily>[
          TotalAmountProvider.$allTransitiveDependencies0,
          TotalAmountProvider.$allTransitiveDependencies1,
        ],
      );

  static const $allTransitiveDependencies0 = isIncomeProvider;
  static const $allTransitiveDependencies1 = transactionsForPeriodProvider;

  @override
  String debugGetCreateSourceHash() => _$totalAmountHash();

  @$internal
  @override
  $FutureProviderElement<double> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<double> create(Ref ref) {
    return totalAmount(ref);
  }
}

String _$totalAmountHash() => r'5913e5cd95a8ac031712fcf26b4e29bdfd2f6b67';

/// Used in analysis.
@ProviderFor(transactionsByCategory)
const transactionsByCategoryProvider = TransactionsByCategoryProvider._();

/// Used in analysis.
final class TransactionsByCategoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<Category, List<Transaction>>>,
          Map<Category, List<Transaction>>,
          FutureOr<Map<Category, List<Transaction>>>
        >
    with
        $FutureModifier<Map<Category, List<Transaction>>>,
        $FutureProvider<Map<Category, List<Transaction>>> {
  /// Used in analysis.
  const TransactionsByCategoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionsByCategoryProvider',
        isAutoDispose: true,
        dependencies: const <ProviderOrFamily>[
          isIncomeProvider,
          transactionsForPeriodProvider,
        ],
        $allTransitiveDependencies: const <ProviderOrFamily>[
          TransactionsByCategoryProvider.$allTransitiveDependencies0,
          TransactionsByCategoryProvider.$allTransitiveDependencies1,
        ],
      );

  static const $allTransitiveDependencies0 = isIncomeProvider;
  static const $allTransitiveDependencies1 = transactionsForPeriodProvider;

  @override
  String debugGetCreateSourceHash() => _$transactionsByCategoryHash();

  @$internal
  @override
  $FutureProviderElement<Map<Category, List<Transaction>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<Category, List<Transaction>>> create(Ref ref) {
    return transactionsByCategory(ref);
  }
}

String _$transactionsByCategoryHash() =>
    r'ceea8c745fb7df9e839839f078f3005aade60b6d';

/// Used in history.
@ProviderFor(sortedTransactions)
const sortedTransactionsProvider = SortedTransactionsProvider._();

/// Used in history.
final class SortedTransactionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Transaction>>,
          List<Transaction>,
          FutureOr<List<Transaction>>
        >
    with
        $FutureModifier<List<Transaction>>,
        $FutureProvider<List<Transaction>> {
  /// Used in history.
  const SortedTransactionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sortedTransactionsProvider',
        isAutoDispose: true,
        dependencies: const <ProviderOrFamily>[
          isIncomeProvider,
          transactionsForPeriodProvider,
        ],
        $allTransitiveDependencies: const <ProviderOrFamily>[
          SortedTransactionsProvider.$allTransitiveDependencies0,
          SortedTransactionsProvider.$allTransitiveDependencies1,
        ],
      );

  static const $allTransitiveDependencies0 = isIncomeProvider;
  static const $allTransitiveDependencies1 = transactionsForPeriodProvider;

  @override
  String debugGetCreateSourceHash() => _$sortedTransactionsHash();

  @$internal
  @override
  $FutureProviderElement<List<Transaction>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Transaction>> create(Ref ref) {
    return sortedTransactions(ref);
  }
}

String _$sortedTransactionsHash() =>
    r'fb7e3b1b24e3d6d795771577ee53fb7ea9e10823';

@ProviderFor(TransactionsRange)
const transactionsRangeProvider = TransactionsRangeFamily._();

final class TransactionsRangeProvider
    extends $NotifierProvider<TransactionsRange, DateRange> {
  const TransactionsRangeProvider._({
    required TransactionsRangeFamily super.from,
    required bool super.argument,
  }) : super(
         retry: null,
         name: r'transactionsRangeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$transactionsRangeHash();

  @override
  String toString() {
    return r'transactionsRangeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TransactionsRange create() => TransactionsRange();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateRange value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateRange>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TransactionsRangeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$transactionsRangeHash() => r'b78ddcde787eca001ca7f50d42c7d19f8b1089b9';

final class TransactionsRangeFamily extends $Family
    with
        $ClassFamilyOverride<
          TransactionsRange,
          DateRange,
          DateRange,
          DateRange,
          bool
        > {
  const TransactionsRangeFamily._()
    : super(
        retry: null,
        name: r'transactionsRangeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TransactionsRangeProvider call(bool isIncome) =>
      TransactionsRangeProvider._(argument: isIncome, from: this);

  @override
  String toString() => r'transactionsRangeProvider';
}

abstract class _$TransactionsRange extends $Notifier<DateRange> {
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
    r'25b7c9d52c9e47253ab03705f04aa6c52b829821';

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
