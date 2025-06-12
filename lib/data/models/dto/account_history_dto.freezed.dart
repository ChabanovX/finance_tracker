// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_history_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountHistoryDto {

 int get id; int get accountId; String get changeType; AccountStateDto? get previousState; AccountStateDto get newState; DateTime get changeTimestamp; DateTime get createdAt;
/// Create a copy of AccountHistoryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountHistoryDtoCopyWith<AccountHistoryDto> get copyWith => _$AccountHistoryDtoCopyWithImpl<AccountHistoryDto>(this as AccountHistoryDto, _$identity);

  /// Serializes this AccountHistoryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountHistoryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.changeType, changeType) || other.changeType == changeType)&&(identical(other.previousState, previousState) || other.previousState == previousState)&&(identical(other.newState, newState) || other.newState == newState)&&(identical(other.changeTimestamp, changeTimestamp) || other.changeTimestamp == changeTimestamp)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountId,changeType,previousState,newState,changeTimestamp,createdAt);

@override
String toString() {
  return 'AccountHistoryDto(id: $id, accountId: $accountId, changeType: $changeType, previousState: $previousState, newState: $newState, changeTimestamp: $changeTimestamp, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AccountHistoryDtoCopyWith<$Res>  {
  factory $AccountHistoryDtoCopyWith(AccountHistoryDto value, $Res Function(AccountHistoryDto) _then) = _$AccountHistoryDtoCopyWithImpl;
@useResult
$Res call({
 int id, int accountId, String changeType, AccountStateDto? previousState, AccountStateDto newState, DateTime changeTimestamp, DateTime createdAt
});


$AccountStateDtoCopyWith<$Res>? get previousState;$AccountStateDtoCopyWith<$Res> get newState;

}
/// @nodoc
class _$AccountHistoryDtoCopyWithImpl<$Res>
    implements $AccountHistoryDtoCopyWith<$Res> {
  _$AccountHistoryDtoCopyWithImpl(this._self, this._then);

  final AccountHistoryDto _self;
  final $Res Function(AccountHistoryDto) _then;

/// Create a copy of AccountHistoryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? accountId = null,Object? changeType = null,Object? previousState = freezed,Object? newState = null,Object? changeTimestamp = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,changeType: null == changeType ? _self.changeType : changeType // ignore: cast_nullable_to_non_nullable
as String,previousState: freezed == previousState ? _self.previousState : previousState // ignore: cast_nullable_to_non_nullable
as AccountStateDto?,newState: null == newState ? _self.newState : newState // ignore: cast_nullable_to_non_nullable
as AccountStateDto,changeTimestamp: null == changeTimestamp ? _self.changeTimestamp : changeTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of AccountHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountStateDtoCopyWith<$Res>? get previousState {
    if (_self.previousState == null) {
    return null;
  }

  return $AccountStateDtoCopyWith<$Res>(_self.previousState!, (value) {
    return _then(_self.copyWith(previousState: value));
  });
}/// Create a copy of AccountHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountStateDtoCopyWith<$Res> get newState {
  
  return $AccountStateDtoCopyWith<$Res>(_self.newState, (value) {
    return _then(_self.copyWith(newState: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _AccountHistoryDto implements AccountHistoryDto {
  const _AccountHistoryDto({required this.id, required this.accountId, required this.changeType, this.previousState, required this.newState, required this.changeTimestamp, required this.createdAt});
  factory _AccountHistoryDto.fromJson(Map<String, dynamic> json) => _$AccountHistoryDtoFromJson(json);

@override final  int id;
@override final  int accountId;
@override final  String changeType;
@override final  AccountStateDto? previousState;
@override final  AccountStateDto newState;
@override final  DateTime changeTimestamp;
@override final  DateTime createdAt;

/// Create a copy of AccountHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountHistoryDtoCopyWith<_AccountHistoryDto> get copyWith => __$AccountHistoryDtoCopyWithImpl<_AccountHistoryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountHistoryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountHistoryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.changeType, changeType) || other.changeType == changeType)&&(identical(other.previousState, previousState) || other.previousState == previousState)&&(identical(other.newState, newState) || other.newState == newState)&&(identical(other.changeTimestamp, changeTimestamp) || other.changeTimestamp == changeTimestamp)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountId,changeType,previousState,newState,changeTimestamp,createdAt);

@override
String toString() {
  return 'AccountHistoryDto(id: $id, accountId: $accountId, changeType: $changeType, previousState: $previousState, newState: $newState, changeTimestamp: $changeTimestamp, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AccountHistoryDtoCopyWith<$Res> implements $AccountHistoryDtoCopyWith<$Res> {
  factory _$AccountHistoryDtoCopyWith(_AccountHistoryDto value, $Res Function(_AccountHistoryDto) _then) = __$AccountHistoryDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, int accountId, String changeType, AccountStateDto? previousState, AccountStateDto newState, DateTime changeTimestamp, DateTime createdAt
});


@override $AccountStateDtoCopyWith<$Res>? get previousState;@override $AccountStateDtoCopyWith<$Res> get newState;

}
/// @nodoc
class __$AccountHistoryDtoCopyWithImpl<$Res>
    implements _$AccountHistoryDtoCopyWith<$Res> {
  __$AccountHistoryDtoCopyWithImpl(this._self, this._then);

  final _AccountHistoryDto _self;
  final $Res Function(_AccountHistoryDto) _then;

/// Create a copy of AccountHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? accountId = null,Object? changeType = null,Object? previousState = freezed,Object? newState = null,Object? changeTimestamp = null,Object? createdAt = null,}) {
  return _then(_AccountHistoryDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,changeType: null == changeType ? _self.changeType : changeType // ignore: cast_nullable_to_non_nullable
as String,previousState: freezed == previousState ? _self.previousState : previousState // ignore: cast_nullable_to_non_nullable
as AccountStateDto?,newState: null == newState ? _self.newState : newState // ignore: cast_nullable_to_non_nullable
as AccountStateDto,changeTimestamp: null == changeTimestamp ? _self.changeTimestamp : changeTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of AccountHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountStateDtoCopyWith<$Res>? get previousState {
    if (_self.previousState == null) {
    return null;
  }

  return $AccountStateDtoCopyWith<$Res>(_self.previousState!, (value) {
    return _then(_self.copyWith(previousState: value));
  });
}/// Create a copy of AccountHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountStateDtoCopyWith<$Res> get newState {
  
  return $AccountStateDtoCopyWith<$Res>(_self.newState, (value) {
    return _then(_self.copyWith(newState: value));
  });
}
}

// dart format on
