import 'package:flutter/material.dart';
import 'package:push_notification/domain/models/chat/chat_new_message.dart';
import 'package:push_notification/utils/result.dart';

abstract class ChatRepository extends ChangeNotifier {
  Future<Result<void>> sendMessage(ChatNewMessage message);
}
