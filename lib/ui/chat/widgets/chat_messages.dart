import 'package:flutter/material.dart';
import 'package:push_notification/ui/chat/view_models/chat_view_model.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key, required this.viewModel});

  final ChatViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final stream = viewModel.stream;
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
            final chatMessage = chatSnapshots.data!.docs[index].data();
            return ListTile(
              title: Text(chatMessage['userName']),
              subtitle: Text(chatMessage['text']),
              trailing: Text(
                chatMessage['createdAt'].toDate().toLocal().toString(),
              ),
            );
          },
        );
      },
    );
  }
}
