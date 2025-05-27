import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_new_message.freezed.dart';

@freezed
class ChatNewMessage with _$ChatNewMessage {
  const factory ChatNewMessage({
    required String userId,
    required String userName,
    required String text,
    required Timestamp createdAt,
  }) = _ChatNewMessage;
}
