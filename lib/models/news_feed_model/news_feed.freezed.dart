// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'news_feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsFeed _$NewsFeedFromJson(Map<String, dynamic> json) {
  return _NewsFeed.fromJson(json);
}

/// @nodoc
class _$NewsFeedTearOff {
  const _$NewsFeedTearOff();

  _NewsFeed call(
      {required String documentID,
      required int comments,
      required String headline,
      required String summary,
      required String? image}) {
    return _NewsFeed(
      documentID: documentID,
      comments: comments,
      headline: headline,
      summary: summary,
      image: image,
    );
  }

  NewsFeed fromJson(Map<String, Object?> json) {
    return NewsFeed.fromJson(json);
  }
}

/// @nodoc
const $NewsFeed = _$NewsFeedTearOff();

/// @nodoc
mixin _$NewsFeed {
  String get documentID => throw _privateConstructorUsedError;
  int get comments => throw _privateConstructorUsedError;
  String get headline => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsFeedCopyWith<NewsFeed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsFeedCopyWith<$Res> {
  factory $NewsFeedCopyWith(NewsFeed value, $Res Function(NewsFeed) then) =
      _$NewsFeedCopyWithImpl<$Res>;
  $Res call(
      {String documentID,
      int comments,
      String headline,
      String summary,
      String? image});
}

/// @nodoc
class _$NewsFeedCopyWithImpl<$Res> implements $NewsFeedCopyWith<$Res> {
  _$NewsFeedCopyWithImpl(this._value, this._then);

  final NewsFeed _value;
  // ignore: unused_field
  final $Res Function(NewsFeed) _then;

  @override
  $Res call({
    Object? documentID = freezed,
    Object? comments = freezed,
    Object? headline = freezed,
    Object? summary = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      documentID: documentID == freezed
          ? _value.documentID
          : documentID // ignore: cast_nullable_to_non_nullable
              as String,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      headline: headline == freezed
          ? _value.headline
          : headline // ignore: cast_nullable_to_non_nullable
              as String,
      summary: summary == freezed
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$NewsFeedCopyWith<$Res> implements $NewsFeedCopyWith<$Res> {
  factory _$NewsFeedCopyWith(_NewsFeed value, $Res Function(_NewsFeed) then) =
      __$NewsFeedCopyWithImpl<$Res>;
  @override
  $Res call(
      {String documentID,
      int comments,
      String headline,
      String summary,
      String? image});
}

/// @nodoc
class __$NewsFeedCopyWithImpl<$Res> extends _$NewsFeedCopyWithImpl<$Res>
    implements _$NewsFeedCopyWith<$Res> {
  __$NewsFeedCopyWithImpl(_NewsFeed _value, $Res Function(_NewsFeed) _then)
      : super(_value, (v) => _then(v as _NewsFeed));

  @override
  _NewsFeed get _value => super._value as _NewsFeed;

  @override
  $Res call({
    Object? documentID = freezed,
    Object? comments = freezed,
    Object? headline = freezed,
    Object? summary = freezed,
    Object? image = freezed,
  }) {
    return _then(_NewsFeed(
      documentID: documentID == freezed
          ? _value.documentID
          : documentID // ignore: cast_nullable_to_non_nullable
              as String,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      headline: headline == freezed
          ? _value.headline
          : headline // ignore: cast_nullable_to_non_nullable
              as String,
      summary: summary == freezed
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewsFeed implements _NewsFeed {
  _$_NewsFeed(
      {required this.documentID,
      required this.comments,
      required this.headline,
      required this.summary,
      required this.image});

  factory _$_NewsFeed.fromJson(Map<String, dynamic> json) =>
      _$$_NewsFeedFromJson(json);

  @override
  final String documentID;
  @override
  final int comments;
  @override
  final String headline;
  @override
  final String summary;
  @override
  final String? image;

  @override
  String toString() {
    return 'NewsFeed(documentID: $documentID, comments: $comments, headline: $headline, summary: $summary, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsFeed &&
            const DeepCollectionEquality()
                .equals(other.documentID, documentID) &&
            const DeepCollectionEquality().equals(other.comments, comments) &&
            const DeepCollectionEquality().equals(other.headline, headline) &&
            const DeepCollectionEquality().equals(other.summary, summary) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(documentID),
      const DeepCollectionEquality().hash(comments),
      const DeepCollectionEquality().hash(headline),
      const DeepCollectionEquality().hash(summary),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$NewsFeedCopyWith<_NewsFeed> get copyWith =>
      __$NewsFeedCopyWithImpl<_NewsFeed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsFeedToJson(this);
  }
}

abstract class _NewsFeed implements NewsFeed {
  factory _NewsFeed(
      {required String documentID,
      required int comments,
      required String headline,
      required String summary,
      required String? image}) = _$_NewsFeed;

  factory _NewsFeed.fromJson(Map<String, dynamic> json) = _$_NewsFeed.fromJson;

  @override
  String get documentID;
  @override
  int get comments;
  @override
  String get headline;
  @override
  String get summary;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$NewsFeedCopyWith<_NewsFeed> get copyWith =>
      throw _privateConstructorUsedError;
}
