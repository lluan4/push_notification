import 'package:push_notification/data/repositories/chat/chat_repository.dart';
import 'package:push_notification/data/services/api/api_client.dart';
import 'package:push_notification/data/services/api/models/chat/chat_api_model.dart';
import 'package:push_notification/domain/models/chat/chat_new_message.dart';
import 'package:push_notification/utils/result.dart';

class ChatRepositoryRemote extends ChatRepository {
  ChatRepositoryRemote({required this.authApiClient});

  final ApiClient authApiClient;

  @override
  Future<Result<void>> sendMessage(ChatNewMessage message) async {
    final chatMessage = ChatApiModel(
      userId: message.userId,
      userName: message.userName,
      text: message.text,
      createdAt: message.createdAt,
    );

    final result = await authApiClient.createMessage(chatMessage);

    notifyListeners();
    return result;
  }
}
