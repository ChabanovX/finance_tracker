// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_history_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountHistoryResponseDto {

 int get accountId; String get accountName; String get currency;@StringToDoubleConverter() double get currentBalance; List<AccountHistoryDto> get history;
/// Create a copy of AccountHistoryResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountHistoryResponseDtoCopyWith<AccountHistoryResponseDto> get copyWith => _$AccountHistoryResponseDtoCopyWithImpl<AccountHistoryResponseDto>(this as AccountHistoryResponseDto, _$identity);

  /// Serializes this AccountHistoryResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountHistoryResponseDto&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.currentBalance, currentBalance) || other.currentBalance == currentBalance)&&const DeepCollectionEquality().equals(other.history, history));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,accountName,currency,currentBalance,const DeepCollectionEquality().hash(history));

@override
String toString() {
  return 'AccountHistoryResponseDto(accountId: $accountId, accountName: $accountName, currency: $currency, currentBalance: $currentBalance, history: $history)';
}


}

/// @nodoc
abstract mixin class $AccountHistoryResponseDtoCopyWith<$Res>  {
  factory $AccountHistoryResponseDtoCopyWith(AccountHistoryResponseDto value, $Res Function(AccountHistoryResponseDto) _then) = _$AccountHistoryResponseDtoCopyWithImpl;
@useResult
$Res call({
 int accountId, String accountName, String currency,@StringToDoubleConverter() double currentBalance, List<AccountHistoryDto> history
});




}
/// @nodoc
class _$AccountHistoryResponseDtoCopyWithImpl<$Res>
    implements $AccountHistoryResponseDtoCopyWith<$Res> {
  _$AccountHistoryResponseDtoCopyWithImpl(this._self, this._then);

  final AccountHistoryResponseDto _self;
  final $Res Function(AccountHistoryResponseDto) _then;

/// Create a copy of AccountHistoryResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = null,Object? accountName = null,Object? currency = null,Object? currentBalance = null,Object? history = null,}) {
  return _then(_self.copyWith(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,currentBalance: null == currentBalance ? _self.currentBalance : currentBalance // ignore: cast_nullable_to_non_nullable
as double,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<AccountHistoryDto>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AccountHistoryResponseDto implements AccountHistoryResponseDto {
  const _AccountHistoryResponseDto({required this.accountId, required this.accountName, required this.currency, @StringToDoubleConverter() required this.currentBalance, required final  List<AccountHistoryDto> history}): _history = history;
  factory _AccountHistoryResponseDto.fromJson(Map<String, dynamic> json) => _$AccountHistoryResponseDtoFromJson(json);

@override final  int accountId;
@override final  String accountName;
@override final  String currency;
@override@StringToDoubleConverter() final  double currentBalance;
 final  List<AccountHistoryDto> _history;
@override List<AccountHistoryDto> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}


/// Create a copy of AccountHistoryResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountHistoryResponseDtoCopyWith<_AccountHistoryResponseDto> get copyWith => __$AccountHistoryResponseDtoCopyWithImpl<_AccountHistoryResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountHistoryResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountHistoryResponseDto&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.currentBalance, currentBalance) || other.currentBalance == currentBalance)&&const DeepCollectionEquality().equals(other._history, _history));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,accountName,currency,currentBalance,const DeepCollectionEquality().hash(_history));

@override
String toString() {
  return 'AccountHistoryResponseDto(accountId: $accountId, accountName: $accountName, currency: $currency, currentBalance: $currentBalance, history: $history)';
}


}

/// @nodoc
abstract mixin class _$AccountHistoryResponseDtoCopyWith<$Res> implements $AccountHistoryResponseDtoCopyWith<$Res> {
  factory _$AccountHistoryResponseDtoCopyWith(_AccountHistoryResponseDto value, $Res Function(_AccountHistoryResponseDto) _then) = __$AccountHistoryResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 int accountId, String accountName, String currency,@StringToDoubleConverter() double currentBalance, List<AccountHistoryDto> history
});




}
/// @nodoc
class __$AccountHistoryResponseDtoCopyWithImpl<$Res>
    implements _$AccountHistoryResponseDtoCopyWith<$Res> {
  __$AccountHistoryResponseDtoCopyWithImpl(this._self, this._then);

  final _AccountHistoryResponseDto _self;
  final $Res Function(_AccountHistoryResponseDto) _then;

/// Create a copy of AccountHistoryResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = null,Object? accountName = null,Object? currency = null,Object? currentBalance = null,Object? history = null,}) {
  return _then(_AccountHistoryResponseDto(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,currentBalance: null == currentBalance ? _self.currentBalance : currentBalance // ignore: cast_nullable_to_non_nullable
as double,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<AccountHistoryDto>,
  ));
}


}

// dart format on
