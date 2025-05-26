import 'package:flutter/material.dart';
import 'package:push_notification/ui/chat/view_models/chat_view_model.dart';

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
      body: const Center(
        child: Text(
          'Logado com sucesso!',
        ),
      ),
    );
  }
}
