import 'package:flutter/material.dart';
import 'package:push_notification/ui/chat/view_models/chat_view_model.dart';
import 'package:push_notification/ui/chat/widgets/chat_message_bubble.dart';

class ChatMessages extends StatefulWidget {
  const ChatMessages({super.key, required this.viewModel});

  final ChatViewModel viewModel;

  @override
  State<ChatMessages> createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  @override
  void initState() {
    widget.viewModel.setupPushNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stream = widget.viewModel.stream;
    final authenticatedUser = widget.viewModel.authRepository.authenticatedUser;
    const String image = 'assets/images/avatar.jpg';

    return StreamBuilder(
      stream: stream,
      builder: (ctx, chatSnapshots) {
        if (chatSnapshots.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!chatSnapshots.hasData || chatSnapshots.data!.docs.isEmpty) {
          return const Center(
            child: Text('Nenhuma mensagem enviada ainda!'),
          );
        }

        return ListView.builder(
          itemCount: chatSnapshots.data!.docs.length,
          padding: const EdgeInsets.only(bottom: 40, left: 13, right: 13),
          reverse: true,
          itemBuilder: (ctx, index) {
            final hasNext = index + 1 < chatSnapshots.data!.docs.length;
            final chatMessage = chatSnapshots.data!.docs[index].data();
            final nextChatMessage =
                hasNext ? chatSnapshots.data!.docs[index + 1].data() : null;

            final currentMessageUserId = chatMessage['userId'];
            final nextMessageUserId =
                nextChatMessage != null ? nextChatMessage['userId'] : null;

            final nextUserIsSame = currentMessageUserId == nextMessageUserId;

            if (nextUserIsSame) {
              return ChatMessageBubble.next(
                message: chatMessage['text'],
                isMe: authenticatedUser.uid == currentMessageUserId,
              );
            }

            return ChatMessageBubble.first(
              username: chatMessage['userName'],
              userImage: image,
              message: chatMessage['text'],
              isMe: authenticatedUser.uid == currentMessageUserId,
            );
          },
        );
      },
    );
  }
}
