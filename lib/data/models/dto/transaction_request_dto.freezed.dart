// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionRequestDto {

 int get accountId; int get categoryId;@StringToDoubleConverter() double get amount; DateTime get transactionDate; String? get comment;
/// Create a copy of TransactionRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionRequestDtoCopyWith<TransactionRequestDto> get copyWith => _$TransactionRequestDtoCopyWithImpl<TransactionRequestDto>(this as TransactionRequestDto, _$identity);

  /// Serializes this TransactionRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionRequestDto&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,categoryId,amount,transactionDate,comment);

@override
String toString() {
  return 'TransactionRequestDto(accountId: $accountId, categoryId: $categoryId, amount: $amount, transactionDate: $transactionDate, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $TransactionRequestDtoCopyWith<$Res>  {
  factory $TransactionRequestDtoCopyWith(TransactionRequestDto value, $Res Function(TransactionRequestDto) _then) = _$TransactionRequestDtoCopyWithImpl;
@useResult
$Res call({
 int accountId, int categoryId,@StringToDoubleConverter() double amount, DateTime transactionDate, String? comment
});




}
/// @nodoc
class _$TransactionRequestDtoCopyWithImpl<$Res>
    implements $TransactionRequestDtoCopyWith<$Res> {
  _$TransactionRequestDtoCopyWithImpl(this._self, this._then);

  final TransactionRequestDto _self;
  final $Res Function(TransactionRequestDto) _then;

/// Create a copy of TransactionRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = null,Object? categoryId = null,Object? amount = null,Object? transactionDate = null,Object? comment = freezed,}) {
  return _then(_self.copyWith(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TransactionRequestDto extends TransactionRequestDto {
  const _TransactionRequestDto({required this.accountId, required this.categoryId, @StringToDoubleConverter() required this.amount, required this.transactionDate, this.comment}): super._();
  factory _TransactionRequestDto.fromJson(Map<String, dynamic> json) => _$TransactionRequestDtoFromJson(json);

@override final  int accountId;
@override final  int categoryId;
@override@StringToDoubleConverter() final  double amount;
@override final  DateTime transactionDate;
@override final  String? comment;

/// Create a copy of TransactionRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionRequestDtoCopyWith<_TransactionRequestDto> get copyWith => __$TransactionRequestDtoCopyWithImpl<_TransactionRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionRequestDto&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,categoryId,amount,transactionDate,comment);

@override
String toString() {
  return 'TransactionRequestDto(accountId: $accountId, categoryId: $categoryId, amount: $amount, transactionDate: $transactionDate, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$TransactionRequestDtoCopyWith<$Res> implements $TransactionRequestDtoCopyWith<$Res> {
  factory _$TransactionRequestDtoCopyWith(_TransactionRequestDto value, $Res Function(_TransactionRequestDto) _then) = __$TransactionRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 int accountId, int categoryId,@StringToDoubleConverter() double amount, DateTime transactionDate, String? comment
});




}
/// @nodoc
class __$TransactionRequestDtoCopyWithImpl<$Res>
    implements _$TransactionRequestDtoCopyWith<$Res> {
  __$TransactionRequestDtoCopyWithImpl(this._self, this._then);

  final _TransactionRequestDto _self;
  final $Res Function(_TransactionRequestDto) _then;

/// Create a copy of TransactionRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = null,Object? categoryId = null,Object? amount = null,Object? transactionDate = null,Object? comment = freezed,}) {
  return _then(_TransactionRequestDto(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
