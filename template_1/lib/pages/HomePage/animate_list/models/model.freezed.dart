// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailsModel {
  String? get userId => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  List<dynamic>? get imgArr => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get saying => throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;
  List<dynamic>? get comments => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailsModelCopyWith<DetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsModelCopyWith<$Res> {
  factory $DetailsModelCopyWith(
          DetailsModel value, $Res Function(DetailsModel) then) =
      _$DetailsModelCopyWithImpl<$Res>;
  $Res call(
      {String? userId,
      String? username,
      List<dynamic>? imgArr,
      String? avatar,
      String? saying,
      String? details,
      List<dynamic>? comments});
}

/// @nodoc
class _$DetailsModelCopyWithImpl<$Res> implements $DetailsModelCopyWith<$Res> {
  _$DetailsModelCopyWithImpl(this._value, this._then);

  final DetailsModel _value;
  // ignore: unused_field
  final $Res Function(DetailsModel) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? username = freezed,
    Object? imgArr = freezed,
    Object? avatar = freezed,
    Object? saying = freezed,
    Object? details = freezed,
    Object? comments = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      imgArr: imgArr == freezed
          ? _value.imgArr
          : imgArr // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      saying: saying == freezed
          ? _value.saying
          : saying // ignore: cast_nullable_to_non_nullable
              as String?,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
abstract class _$$_DetailsModelCopyWith<$Res>
    implements $DetailsModelCopyWith<$Res> {
  factory _$$_DetailsModelCopyWith(
          _$_DetailsModel value, $Res Function(_$_DetailsModel) then) =
      __$$_DetailsModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? userId,
      String? username,
      List<dynamic>? imgArr,
      String? avatar,
      String? saying,
      String? details,
      List<dynamic>? comments});
}

/// @nodoc
class __$$_DetailsModelCopyWithImpl<$Res>
    extends _$DetailsModelCopyWithImpl<$Res>
    implements _$$_DetailsModelCopyWith<$Res> {
  __$$_DetailsModelCopyWithImpl(
      _$_DetailsModel _value, $Res Function(_$_DetailsModel) _then)
      : super(_value, (v) => _then(v as _$_DetailsModel));

  @override
  _$_DetailsModel get _value => super._value as _$_DetailsModel;

  @override
  $Res call({
    Object? userId = freezed,
    Object? username = freezed,
    Object? imgArr = freezed,
    Object? avatar = freezed,
    Object? saying = freezed,
    Object? details = freezed,
    Object? comments = freezed,
  }) {
    return _then(_$_DetailsModel(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      imgArr: imgArr == freezed
          ? _value._imgArr
          : imgArr // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      saying: saying == freezed
          ? _value.saying
          : saying // ignore: cast_nullable_to_non_nullable
              as String?,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: comments == freezed
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc

class _$_DetailsModel with DiagnosticableTreeMixin implements _DetailsModel {
  const _$_DetailsModel(
      {required this.userId,
      required this.username,
      required final List<dynamic>? imgArr,
      required this.avatar,
      required this.saying,
      required this.details,
      required final List<dynamic>? comments})
      : _imgArr = imgArr,
        _comments = comments;

  @override
  final String? userId;
  @override
  final String? username;
  final List<dynamic>? _imgArr;
  @override
  List<dynamic>? get imgArr {
    final value = _imgArr;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? avatar;
  @override
  final String? saying;
  @override
  final String? details;
  final List<dynamic>? _comments;
  @override
  List<dynamic>? get comments {
    final value = _comments;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DetailsModel(userId: $userId, username: $username, imgArr: $imgArr, avatar: $avatar, saying: $saying, details: $details, comments: $comments)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DetailsModel'))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('imgArr', imgArr))
      ..add(DiagnosticsProperty('avatar', avatar))
      ..add(DiagnosticsProperty('saying', saying))
      ..add(DiagnosticsProperty('details', details))
      ..add(DiagnosticsProperty('comments', comments));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailsModel &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other._imgArr, _imgArr) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.saying, saying) &&
            const DeepCollectionEquality().equals(other.details, details) &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(_imgArr),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(saying),
      const DeepCollectionEquality().hash(details),
      const DeepCollectionEquality().hash(_comments));

  @JsonKey(ignore: true)
  @override
  _$$_DetailsModelCopyWith<_$_DetailsModel> get copyWith =>
      __$$_DetailsModelCopyWithImpl<_$_DetailsModel>(this, _$identity);
}

abstract class _DetailsModel implements DetailsModel {
  const factory _DetailsModel(
      {required final String? userId,
      required final String? username,
      required final List<dynamic>? imgArr,
      required final String? avatar,
      required final String? saying,
      required final String? details,
      required final List<dynamic>? comments}) = _$_DetailsModel;

  @override
  String? get userId;
  @override
  String? get username;
  @override
  List<dynamic>? get imgArr;
  @override
  String? get avatar;
  @override
  String? get saying;
  @override
  String? get details;
  @override
  List<dynamic>? get comments;
  @override
  @JsonKey(ignore: true)
  _$$_DetailsModelCopyWith<_$_DetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
