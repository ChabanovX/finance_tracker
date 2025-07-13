// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionView {

 List<Transaction> get sorted; double get total; Map<Category, List<Transaction>> get byCategory;
/// Create a copy of TransactionView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionViewCopyWith<TransactionView> get copyWith => _$TransactionViewCopyWithImpl<TransactionView>(this as TransactionView, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionView&&const DeepCollectionEquality().equals(other.sorted, sorted)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.byCategory, byCategory));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sorted),total,const DeepCollectionEquality().hash(byCategory));

@override
String toString() {
  return 'TransactionView(sorted: $sorted, total: $total, byCategory: $byCategory)';
}


}

/// @nodoc
abstract mixin class $TransactionViewCopyWith<$Res>  {
  factory $TransactionViewCopyWith(TransactionView value, $Res Function(TransactionView) _then) = _$TransactionViewCopyWithImpl;
@useResult
$Res call({
 List<Transaction> sorted, double total, Map<Category, List<Transaction>> byCategory
});




}
/// @nodoc
class _$TransactionViewCopyWithImpl<$Res>
    implements $TransactionViewCopyWith<$Res> {
  _$TransactionViewCopyWithImpl(this._self, this._then);

  final TransactionView _self;
  final $Res Function(TransactionView) _then;

/// Create a copy of TransactionView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sorted = null,Object? total = null,Object? byCategory = null,}) {
  return _then(_self.copyWith(
sorted: null == sorted ? _self.sorted : sorted // ignore: cast_nullable_to_non_nullable
as List<Transaction>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,byCategory: null == byCategory ? _self.byCategory : byCategory // ignore: cast_nullable_to_non_nullable
as Map<Category, List<Transaction>>,
  ));
}

}


/// @nodoc


class _TransactionView implements TransactionView {
  const _TransactionView({required final  List<Transaction> sorted, required this.total, required final  Map<Category, List<Transaction>> byCategory}): _sorted = sorted,_byCategory = byCategory;
  

 final  List<Transaction> _sorted;
@override List<Transaction> get sorted {
  if (_sorted is EqualUnmodifiableListView) return _sorted;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sorted);
}

@override final  double total;
 final  Map<Category, List<Transaction>> _byCategory;
@override Map<Category, List<Transaction>> get byCategory {
  if (_byCategory is EqualUnmodifiableMapView) return _byCategory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_byCategory);
}


/// Create a copy of TransactionView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionViewCopyWith<_TransactionView> get copyWith => __$TransactionViewCopyWithImpl<_TransactionView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionView&&const DeepCollectionEquality().equals(other._sorted, _sorted)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other._byCategory, _byCategory));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sorted),total,const DeepCollectionEquality().hash(_byCategory));

@override
String toString() {
  return 'TransactionView(sorted: $sorted, total: $total, byCategory: $byCategory)';
}


}

/// @nodoc
abstract mixin class _$TransactionViewCopyWith<$Res> implements $TransactionViewCopyWith<$Res> {
  factory _$TransactionViewCopyWith(_TransactionView value, $Res Function(_TransactionView) _then) = __$TransactionViewCopyWithImpl;
@override @useResult
$Res call({
 List<Transaction> sorted, double total, Map<Category, List<Transaction>> byCategory
});




}
/// @nodoc
class __$TransactionViewCopyWithImpl<$Res>
    implements _$TransactionViewCopyWith<$Res> {
  __$TransactionViewCopyWithImpl(this._self, this._then);

  final _TransactionView _self;
  final $Res Function(_TransactionView) _then;

/// Create a copy of TransactionView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sorted = null,Object? total = null,Object? byCategory = null,}) {
  return _then(_TransactionView(
sorted: null == sorted ? _self._sorted : sorted // ignore: cast_nullable_to_non_nullable
as List<Transaction>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,byCategory: null == byCategory ? _self._byCategory : byCategory // ignore: cast_nullable_to_non_nullable
as Map<Category, List<Transaction>>,
  ));
}


}

// dart format on
