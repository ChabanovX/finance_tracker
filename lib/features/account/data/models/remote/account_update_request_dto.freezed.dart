// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_update_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountUpdateRequestDto {

 String get name;@StringToDoubleConverter() double get balance; String get currency;
/// Create a copy of AccountUpdateRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountUpdateRequestDtoCopyWith<AccountUpdateRequestDto> get copyWith => _$AccountUpdateRequestDtoCopyWithImpl<AccountUpdateRequestDto>(this as AccountUpdateRequestDto, _$identity);

  /// Serializes this AccountUpdateRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountUpdateRequestDto&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,balance,currency);

@override
String toString() {
  return 'AccountUpdateRequestDto(name: $name, balance: $balance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $AccountUpdateRequestDtoCopyWith<$Res>  {
  factory $AccountUpdateRequestDtoCopyWith(AccountUpdateRequestDto value, $Res Function(AccountUpdateRequestDto) _then) = _$AccountUpdateRequestDtoCopyWithImpl;
@useResult
$Res call({
 String name,@StringToDoubleConverter() double balance, String currency
});




}
/// @nodoc
class _$AccountUpdateRequestDtoCopyWithImpl<$Res>
    implements $AccountUpdateRequestDtoCopyWith<$Res> {
  _$AccountUpdateRequestDtoCopyWithImpl(this._self, this._then);

  final AccountUpdateRequestDto _self;
  final $Res Function(AccountUpdateRequestDto) _then;

/// Create a copy of AccountUpdateRequestDto
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

class _AccountUpdateRequestDto extends AccountUpdateRequestDto {
  const _AccountUpdateRequestDto({required this.name, @StringToDoubleConverter() required this.balance, required this.currency}): super._();
  factory _AccountUpdateRequestDto.fromJson(Map<String, dynamic> json) => _$AccountUpdateRequestDtoFromJson(json);

@override final  String name;
@override@StringToDoubleConverter() final  double balance;
@override final  String currency;

/// Create a copy of AccountUpdateRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountUpdateRequestDtoCopyWith<_AccountUpdateRequestDto> get copyWith => __$AccountUpdateRequestDtoCopyWithImpl<_AccountUpdateRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountUpdateRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountUpdateRequestDto&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,balance,currency);

@override
String toString() {
  return 'AccountUpdateRequestDto(name: $name, balance: $balance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$AccountUpdateRequestDtoCopyWith<$Res> implements $AccountUpdateRequestDtoCopyWith<$Res> {
  factory _$AccountUpdateRequestDtoCopyWith(_AccountUpdateRequestDto value, $Res Function(_AccountUpdateRequestDto) _then) = __$AccountUpdateRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String name,@StringToDoubleConverter() double balance, String currency
});




}
/// @nodoc
class __$AccountUpdateRequestDtoCopyWithImpl<$Res>
    implements _$AccountUpdateRequestDtoCopyWith<$Res> {
  __$AccountUpdateRequestDtoCopyWithImpl(this._self, this._then);

  final _AccountUpdateRequestDto _self;
  final $Res Function(_AccountUpdateRequestDto) _then;

/// Create a copy of AccountUpdateRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? balance = null,Object? currency = null,}) {
  return _then(_AccountUpdateRequestDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
