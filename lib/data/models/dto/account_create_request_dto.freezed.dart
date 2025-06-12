// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_create_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountCreateRequestDto {

 String get name;@StringToDoubleConverter() double get balance; String get currency;
/// Create a copy of AccountCreateRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountCreateRequestDtoCopyWith<AccountCreateRequestDto> get copyWith => _$AccountCreateRequestDtoCopyWithImpl<AccountCreateRequestDto>(this as AccountCreateRequestDto, _$identity);

  /// Serializes this AccountCreateRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountCreateRequestDto&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,balance,currency);

@override
String toString() {
  return 'AccountCreateRequestDto(name: $name, balance: $balance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $AccountCreateRequestDtoCopyWith<$Res>  {
  factory $AccountCreateRequestDtoCopyWith(AccountCreateRequestDto value, $Res Function(AccountCreateRequestDto) _then) = _$AccountCreateRequestDtoCopyWithImpl;
@useResult
$Res call({
 String name,@StringToDoubleConverter() double balance, String currency
});




}
/// @nodoc
class _$AccountCreateRequestDtoCopyWithImpl<$Res>
    implements $AccountCreateRequestDtoCopyWith<$Res> {
  _$AccountCreateRequestDtoCopyWithImpl(this._self, this._then);

  final AccountCreateRequestDto _self;
  final $Res Function(AccountCreateRequestDto) _then;

/// Create a copy of AccountCreateRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? balance = null,Object? currency = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AccountCreateRequestDto extends AccountCreateRequestDto {
  const _AccountCreateRequestDto({required this.name, @StringToDoubleConverter() required this.balance, required this.currency}): super._();
  factory _AccountCreateRequestDto.fromJson(Map<String, dynamic> json) => _$AccountCreateRequestDtoFromJson(json);

@override final  String name;
@override@StringToDoubleConverter() final  double balance;
@override final  String currency;

/// Create a copy of AccountCreateRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountCreateRequestDtoCopyWith<_AccountCreateRequestDto> get copyWith => __$AccountCreateRequestDtoCopyWithImpl<_AccountCreateRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountCreateRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountCreateRequestDto&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,balance,currency);

@override
String toString() {
  return 'AccountCreateRequestDto(name: $name, balance: $balance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$AccountCreateRequestDtoCopyWith<$Res> implements $AccountCreateRequestDtoCopyWith<$Res> {
  factory _$AccountCreateRequestDtoCopyWith(_AccountCreateRequestDto value, $Res Function(_AccountCreateRequestDto) _then) = __$AccountCreateRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String name,@StringToDoubleConverter() double balance, String currency
});




}
/// @nodoc
class __$AccountCreateRequestDtoCopyWithImpl<$Res>
    implements _$AccountCreateRequestDtoCopyWith<$Res> {
  __$AccountCreateRequestDtoCopyWithImpl(this._self, this._then);

  final _AccountCreateRequestDto _self;
  final $Res Function(_AccountCreateRequestDto) _then;

/// Create a copy of AccountCreateRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? balance = null,Object? currency = null,}) {
  return _then(_AccountCreateRequestDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
