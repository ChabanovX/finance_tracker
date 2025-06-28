// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Article {

 int get id; String get emoji; String get text;
/// Create a copy of Article
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticleCopyWith<Article> get copyWith => _$ArticleCopyWithImpl<Article>(this as Article, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Article&&(identical(other.id, id) || other.id == id)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,id,emoji,text);

@override
String toString() {
  return 'Article(id: $id, emoji: $emoji, text: $text)';
}


}

/// @nodoc
abstract mixin class $ArticleCopyWith<$Res>  {
  factory $ArticleCopyWith(Article value, $Res Function(Article) _then) = _$ArticleCopyWithImpl;
@useResult
$Res call({
 int id, String emoji, String text
});




}
/// @nodoc
class _$ArticleCopyWithImpl<$Res>
    implements $ArticleCopyWith<$Res> {
  _$ArticleCopyWithImpl(this._self, this._then);

  final Article _self;
  final $Res Function(Article) _then;

/// Create a copy of Article
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? emoji = null,Object? text = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _Article implements Article {
  const _Article({required this.id, required this.emoji, required this.text});
  

@override final  int id;
@override final  String emoji;
@override final  String text;

/// Create a copy of Article
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArticleCopyWith<_Article> get copyWith => __$ArticleCopyWithImpl<_Article>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Article&&(identical(other.id, id) || other.id == id)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,id,emoji,text);

@override
String toString() {
  return 'Article(id: $id, emoji: $emoji, text: $text)';
}


}

/// @nodoc
abstract mixin class _$ArticleCopyWith<$Res> implements $ArticleCopyWith<$Res> {
  factory _$ArticleCopyWith(_Article value, $Res Function(_Article) _then) = __$ArticleCopyWithImpl;
@override @useResult
$Res call({
 int id, String emoji, String text
});




}
/// @nodoc
class __$ArticleCopyWithImpl<$Res>
    implements _$ArticleCopyWith<$Res> {
  __$ArticleCopyWithImpl(this._self, this._then);

  final _Article _self;
  final $Res Function(_Article) _then;

/// Create a copy of Article
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? emoji = null,Object? text = null,}) {
  return _then(_Article(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
