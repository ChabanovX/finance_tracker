// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionResponseDto {

 int get id; AccountBriefDto get account; CategoryDto get category;@StringToDoubleConverter() double get amount; DateTime get transactionDate; String? get comment; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of TransactionResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionResponseDtoCopyWith<TransactionResponseDto> get copyWith => _$TransactionResponseDtoCopyWithImpl<TransactionResponseDto>(this as TransactionResponseDto, _$identity);

  /// Serializes this TransactionResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionResponseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.account, account) || other.account == account)&&(identical(other.category, category) || other.category == category)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,account,category,amount,transactionDate,comment,createdAt,updatedAt);

@override
String toString() {
  return 'TransactionResponseDto(id: $id, account: $account, category: $category, amount: $amount, transactionDate: $transactionDate, comment: $comment, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TransactionResponseDtoCopyWith<$Res>  {
  factory $TransactionResponseDtoCopyWith(TransactionResponseDto value, $Res Function(TransactionResponseDto) _then) = _$TransactionResponseDtoCopyWithImpl;
@useResult
$Res call({
 int id, AccountBriefDto account, CategoryDto category,@StringToDoubleConverter() double amount, DateTime transactionDate, String? comment, DateTime createdAt, DateTime updatedAt
});


$AccountBriefDtoCopyWith<$Res> get account;$CategoryDtoCopyWith<$Res> get category;

}
/// @nodoc
class _$TransactionResponseDtoCopyWithImpl<$Res>
    implements $TransactionResponseDtoCopyWith<$Res> {
  _$TransactionResponseDtoCopyWithImpl(this._self, this._then);

  final TransactionResponseDto _self;
  final $Res Function(TransactionResponseDto) _then;

/// Create a copy of TransactionResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? account = null,Object? category = null,Object? amount = null,Object? transactionDate = null,Object? comment = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as AccountBriefDto,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryDto,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of TransactionResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountBriefDtoCopyWith<$Res> get account {
  
  return $AccountBriefDtoCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}/// Create a copy of TransactionResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryDtoCopyWith<$Res> get category {
  
  return $CategoryDtoCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _TransactionResponseDto implements TransactionResponseDto {
  const _TransactionResponseDto({required this.id, required this.account, required this.category, @StringToDoubleConverter() required this.amount, required this.transactionDate, this.comment, required this.createdAt, required this.updatedAt});
  factory _TransactionResponseDto.fromJson(Map<String, dynamic> json) => _$TransactionResponseDtoFromJson(json);

@override final  int id;
@override final  AccountBriefDto account;
@override final  CategoryDto category;
@override@StringToDoubleConverter() final  double amount;
@override final  DateTime transactionDate;
@override final  String? comment;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of TransactionResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionResponseDtoCopyWith<_TransactionResponseDto> get copyWith => __$TransactionResponseDtoCopyWithImpl<_TransactionResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionResponseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.account, account) || other.account == account)&&(identical(other.category, category) || other.category == category)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,account,category,amount,transactionDate,comment,createdAt,updatedAt);

@override
String toString() {
  return 'TransactionResponseDto(id: $id, account: $account, category: $category, amount: $amount, transactionDate: $transactionDate, comment: $comment, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TransactionResponseDtoCopyWith<$Res> implements $TransactionResponseDtoCopyWith<$Res> {
  factory _$TransactionResponseDtoCopyWith(_TransactionResponseDto value, $Res Function(_TransactionResponseDto) _then) = __$TransactionResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, AccountBriefDto account, CategoryDto category,@StringToDoubleConverter() double amount, DateTime transactionDate, String? comment, DateTime createdAt, DateTime updatedAt
});


@override $AccountBriefDtoCopyWith<$Res> get account;@override $CategoryDtoCopyWith<$Res> get category;

}
/// @nodoc
class __$TransactionResponseDtoCopyWithImpl<$Res>
    implements _$TransactionResponseDtoCopyWith<$Res> {
  __$TransactionResponseDtoCopyWithImpl(this._self, this._then);

  final _TransactionResponseDto _self;
  final $Res Function(_TransactionResponseDto) _then;

/// Create a copy of TransactionResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? account = null,Object? category = null,Object? amount = null,Object? transactionDate = null,Object? comment = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TransactionResponseDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as AccountBriefDto,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryDto,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of TransactionResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountBriefDtoCopyWith<$Res> get account {
  
  return $AccountBriefDtoCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}/// Create a copy of TransactionResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryDtoCopyWith<$Res> get category {
  
  return $CategoryDtoCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on
