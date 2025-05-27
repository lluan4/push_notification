import 'package:flutter/material.dart';
import 'package:push_notification/ui/chat/view_models/chat_view_model.dart';
import 'package:push_notification/ui/chat/widgets/chat_messages.dart';
import 'package:push_notification/ui/chat/widgets/chat_new_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.viewModel});

  final ChatViewModel viewModel;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final logout = widget.viewModel.logout;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Chat'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: logout,
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ChatMessages(viewModel: widget.viewModel),
            ),
            const SizedBox(height: 20),
            ChatNewMessage(viewModel: widget.viewModel),
          ],
        ),
      ),
    );
  }
}
