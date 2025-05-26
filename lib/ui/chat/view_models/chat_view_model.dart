import 'package:flutter/material.dart';
import 'package:push_notification/data/repositories/auth/auth_repository.dart';

class ChatViewModel extends ChangeNotifier {
  ChatViewModel({required this.authRepository});

  AuthRepository authRepository;

  Future<void> logout() async {
    await authRepository.logout();
  }
}
