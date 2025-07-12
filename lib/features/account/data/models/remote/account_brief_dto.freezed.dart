// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_brief_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountBriefDto {

 int get id; String get name;@StringToDoubleConverter() double get balance; String get currency;
/// Create a copy of AccountBriefDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountBriefDtoCopyWith<AccountBriefDto> get copyWith => _$AccountBriefDtoCopyWithImpl<AccountBriefDto>(this as AccountBriefDto, _$identity);

  /// Serializes this AccountBriefDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountBriefDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,balance,currency);

@override
String toString() {
  return 'AccountBriefDto(id: $id, name: $name, balance: $balance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $AccountBriefDtoCopyWith<$Res>  {
  factory $AccountBriefDtoCopyWith(AccountBriefDto value, $Res Function(AccountBriefDto) _then) = _$AccountBriefDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name,@StringToDoubleConverter() double balance, String currency
});




}
/// @nodoc
class _$AccountBriefDtoCopyWithImpl<$Res>
    implements $AccountBriefDtoCopyWith<$Res> {
  _$AccountBriefDtoCopyWithImpl(this._self, this._then);

  final AccountBriefDto _self;
  final $Res Function(AccountBriefDto) _then;

/// Create a copy of AccountBriefDto
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

class _AccountBriefDto implements AccountBriefDto {
  const _AccountBriefDto({required this.id, required this.name, @StringToDoubleConverter() required this.balance, required this.currency});
  factory _AccountBriefDto.fromJson(Map<String, dynamic> json) => _$AccountBriefDtoFromJson(json);

@override final  int id;
@override final  String name;
@override@StringToDoubleConverter() final  double balance;
@override final  String currency;

/// Create a copy of AccountBriefDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountBriefDtoCopyWith<_AccountBriefDto> get copyWith => __$AccountBriefDtoCopyWithImpl<_AccountBriefDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountBriefDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountBriefDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,balance,currency);

@override
String toString() {
  return 'AccountBriefDto(id: $id, name: $name, balance: $balance, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$AccountBriefDtoCopyWith<$Res> implements $AccountBriefDtoCopyWith<$Res> {
  factory _$AccountBriefDtoCopyWith(_AccountBriefDto value, $Res Function(_AccountBriefDto) _then) = __$AccountBriefDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@StringToDoubleConverter() double balance, String currency
});




}
/// @nodoc
class __$AccountBriefDtoCopyWithImpl<$Res>
    implements _$AccountBriefDtoCopyWith<$Res> {
  __$AccountBriefDtoCopyWithImpl(this._self, this._then);

  final _AccountBriefDto _self;
  final $Res Function(_AccountBriefDto) _then;

/// Create a copy of AccountBriefDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? balance = null,Object? currency = null,}) {
  return _then(_AccountBriefDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
