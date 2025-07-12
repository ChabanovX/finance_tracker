// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_state_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountStateDto {

 int get id; String get name;@StringToDoubleConverter() double get balance; String get currency;
/// Create a copy of AccountStateDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountStateDtoCopyWith<AccountStateDto> get copyWith => _$AccountStateDtoCopyWithImpl<AccountStateDto>(this as AccountStateDto, _$identity);

  /// Serializes this AccountStateDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountStateDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,balance,currency);

@override
String toString() {
  return 'AccountStateDto(id: $id, name: $name, balance: $balance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $AccountStateDtoCopyWith<$Res>  {
  factory $AccountStateDtoCopyWith(AccountStateDto value, $Res Function(AccountStateDto) _then) = _$AccountStateDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name,@StringToDoubleConverter() double balance, String currency
});




}
/// @nodoc
class _$AccountStateDtoCopyWithImpl<$Res>
    implements $AccountStateDtoCopyWith<$Res> {
  _$AccountStateDtoCopyWithImpl(this._self, this._then);

  final AccountStateDto _self;
  final $Res Function(AccountStateDto) _then;

/// Create a copy of AccountStateDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? balance = null,Object? currency = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AccountStateDto implements AccountStateDto {
  const _AccountStateDto({required this.id, required this.name, @StringToDoubleConverter() required this.balance, required this.currency});
  factory _AccountStateDto.fromJson(Map<String, dynamic> json) => _$AccountStateDtoFromJson(json);

@override final  int id;
@override final  String name;
@override@StringToDoubleConverter() final  double balance;
@override final  String currency;

/// Create a copy of AccountStateDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountStateDtoCopyWith<_AccountStateDto> get copyWith => __$AccountStateDtoCopyWithImpl<_AccountStateDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountStateDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountStateDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,balance,currency);

@override
String toString() {
  return 'AccountStateDto(id: $id, name: $name, balance: $balance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$AccountStateDtoCopyWith<$Res> implements $AccountStateDtoCopyWith<$Res> {
  factory _$AccountStateDtoCopyWith(_AccountStateDto value, $Res Function(_AccountStateDto) _then) = __$AccountStateDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@StringToDoubleConverter() double balance, String currency
});




}
/// @nodoc
class __$AccountStateDtoCopyWithImpl<$Res>
    implements _$AccountStateDtoCopyWith<$Res> {
  __$AccountStateDtoCopyWithImpl(this._self, this._then);

  final _AccountStateDto _self;
  final $Res Function(_AccountStateDto) _then;

/// Create a copy of AccountStateDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? balance = null,Object? currency = null,}) {
  return _then(_AccountStateDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
