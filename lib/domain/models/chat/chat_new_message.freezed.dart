// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_new_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatNewMessage {
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  Timestamp get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of ChatNewMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatNewMessageCopyWith<ChatNewMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatNewMessageCopyWith<$Res> {
  factory $ChatNewMessageCopyWith(
          ChatNewMessage value, $Res Function(ChatNewMessage) then) =
      _$ChatNewMessageCopyWithImpl<$Res, ChatNewMessage>;
  @useResult
  $Res call({String userId, String userName, String text, Timestamp createdAt});
}

/// @nodoc
class _$ChatNewMessageCopyWithImpl<$Res, $Val extends ChatNewMessage>
    implements $ChatNewMessageCopyWith<$Res> {
  _$ChatNewMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatNewMessage
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
abstract class _$$ChatNewMessageImplCopyWith<$Res>
    implements $ChatNewMessageCopyWith<$Res> {
  factory _$$ChatNewMessageImplCopyWith(_$ChatNewMessageImpl value,
          $Res Function(_$ChatNewMessageImpl) then) =
      __$$ChatNewMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String userName, String text, Timestamp createdAt});
}

/// @nodoc
class __$$ChatNewMessageImplCopyWithImpl<$Res>
    extends _$ChatNewMessageCopyWithImpl<$Res, _$ChatNewMessageImpl>
    implements _$$ChatNewMessageImplCopyWith<$Res> {
  __$$ChatNewMessageImplCopyWithImpl(
      _$ChatNewMessageImpl _value, $Res Function(_$ChatNewMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatNewMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? text = null,
    Object? createdAt = null,
  }) {
    return _then(_$ChatNewMessageImpl(
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

class _$ChatNewMessageImpl implements _ChatNewMessage {
  const _$ChatNewMessageImpl(
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
    return 'ChatNewMessage(userId: $userId, userName: $userName, text: $text, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatNewMessageImpl &&
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

  /// Create a copy of ChatNewMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatNewMessageImplCopyWith<_$ChatNewMessageImpl> get copyWith =>
      __$$ChatNewMessageImplCopyWithImpl<_$ChatNewMessageImpl>(
          this, _$identity);
}

abstract class _ChatNewMessage implements ChatNewMessage {
  const factory _ChatNewMessage(
      {required final String userId,
      required final String userName,
      required final String text,
      required final Timestamp createdAt}) = _$ChatNewMessageImpl;

  @override
  String get userId;
  @override
  String get userName;
  @override
  String get text;
  @override
  Timestamp get createdAt;

  /// Create a copy of ChatNewMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatNewMessageImplCopyWith<_$ChatNewMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
