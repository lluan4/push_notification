import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_api_model.freezed.dart';

@freezed
class ChatApiModel with _$ChatApiModel {
  const factory ChatApiModel({
    required String userId,
    required String userName,
    required String text,
    required Timestamp createdAt,
  }) = _ChatApiModel;
}
