import 'package:flutter/material.dart';
import 'package:push_notification/ui/chat/view_models/chat_view_model.dart';

class ChatNewMessage extends StatefulWidget {
  const ChatNewMessage({super.key, required this.viewModel});

  final ChatViewModel viewModel;

  @override
  State<ChatNewMessage> createState() => _ChatNewMessageState();
}

class _ChatNewMessageState extends State<ChatNewMessage> {
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    final messageText = _messageController.text.trim();
    if (messageText.isEmpty) return;

    widget.viewModel.sendMessage(messageText);
    _messageController.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 1, bottom: 14),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              decoration: const InputDecoration(
                labelText: 'Mande uma mensagem...',
              ),
            ),
          ),
          IconButton(
            onPressed: _handleSubmit,
            icon: const Icon(
              Icons.send,
            ),
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
