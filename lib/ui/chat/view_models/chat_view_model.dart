import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:push_notification/data/repositories/auth/auth_repository.dart';
import 'package:push_notification/data/repositories/chat/chat_repository.dart';
import 'package:push_notification/domain/models/chat/chat_new_message.dart';
import 'package:push_notification/utils/result.dart';

class ChatViewModel extends ChangeNotifier {
  ChatViewModel({required this.authRepository, required this.chatRepository});

  AuthRepository authRepository;
  ChatRepository chatRepository;

  Stream<QuerySnapshot<Map<String, dynamic>>> get stream =>
      FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots();

  get firebaseAuth => FirebaseAuth.instance.currentUser;

  void setupPushNotifications() async {
    final fcm = FirebaseMessaging.instance;
    await fcm.requestPermission();
    fcm.subscribeToTopic('chat');
  }

  Future<void> logout() async {
    await authRepository.logout();
  }

  Future<Result<void>> sendMessage(String message) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Result.error(Exception('User não está autenticado'));
    }

    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    final userName = userData.data()?['userName'];

    if (userName == null) {
      return Result.error(Exception('Usuário nao tem nome definido'));
    }

    final request = ChatNewMessage(
      userId: user.uid,
      userName: userName,
      text: message,
      createdAt: Timestamp.now(),
    );
    return await chatRepository.sendMessage(request);
  }
}
