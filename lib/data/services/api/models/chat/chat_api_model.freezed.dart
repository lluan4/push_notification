// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatApiModel {
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  Timestamp get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of ChatApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatApiModelCopyWith<ChatApiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatApiModelCopyWith<$Res> {
  factory $ChatApiModelCopyWith(
          ChatApiModel value, $Res Function(ChatApiModel) then) =
      _$ChatApiModelCopyWithImpl<$Res, ChatApiModel>;
  @useResult
  $Res call({String userId, String userName, String text, Timestamp createdAt});
}

/// @nodoc
class _$ChatApiModelCopyWithImpl<$Res, $Val extends ChatApiModel>
    implements $ChatApiModelCopyWith<$Res> {
  _$ChatApiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? text = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatApiModelImplCopyWith<$Res>
    implements $ChatApiModelCopyWith<$Res> {
  factory _$$ChatApiModelImplCopyWith(
          _$ChatApiModelImpl value, $Res Function(_$ChatApiModelImpl) then) =
      __$$ChatApiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String userName, String text, Timestamp createdAt});
}

/// @nodoc
class __$$ChatApiModelImplCopyWithImpl<$Res>
    extends _$ChatApiModelCopyWithImpl<$Res, _$ChatApiModelImpl>
    implements _$$ChatApiModelImplCopyWith<$Res> {
  __$$ChatApiModelImplCopyWithImpl(
      _$ChatApiModelImpl _value, $Res Function(_$ChatApiModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? text = null,
    Object? createdAt = null,
  }) {
    return _then(_$ChatApiModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc

class _$ChatApiModelImpl implements _ChatApiModel {
  const _$ChatApiModelImpl(
      {required this.userId,
      required this.userName,
      required this.text,
      required this.createdAt});

  @override
  final String userId;
  @override
  final String userName;
  @override
  final String text;
  @override
  final Timestamp createdAt;

  @override
  String toString() {
    return 'ChatApiModel(userId: $userId, userName: $userName, text: $text, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatApiModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, userName, text, createdAt);

  /// Create a copy of ChatApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatApiModelImplCopyWith<_$ChatApiModelImpl> get copyWith =>
      __$$ChatApiModelImplCopyWithImpl<_$ChatApiModelImpl>(this, _$identity);
}

abstract class _ChatApiModel implements ChatApiModel {
  const factory _ChatApiModel(
      {required final String userId,
      required final String userName,
      required final String text,
      required final Timestamp createdAt}) = _$ChatApiModelImpl;

  @override
  String get userId;
  @override
  String get userName;
  @override
  String get text;
  @override
  Timestamp get createdAt;

  /// Create a copy of ChatApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatApiModelImplCopyWith<_$ChatApiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
