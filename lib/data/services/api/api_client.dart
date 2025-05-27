import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:push_notification/data/services/api/models/auth_request/auth_request.dart';

import 'package:push_notification/data/services/api/models/auth_response/auth_response.dart';
import 'package:push_notification/data/services/api/models/chat/chat_api_model.dart';

import 'package:push_notification/utils/result.dart';

final _firebaseAuth = FirebaseAuth.instance;
final _firebaseFirestore = FirebaseFirestore.instance;

class ApiClient {
  Future<Result<AuthResponse>> register(AuthRequest registerRequest) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: registerRequest.email,
        password: registerRequest.password,
      );
      await _firebaseFirestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'userName': registerRequest.userName,
        'email': registerRequest.email,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return Result.ok(AuthResponse(userCredential: userCredential));
    } on FirebaseAuthException catch (error) {
      return Result.error(error);
    }
  }

  Future<Result<AuthResponse>> login(
      {required email, required password}) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Result.ok(AuthResponse(userCredential: userCredential));
    } on FirebaseAuthException catch (error) {
      return Result.error(error);
    }
  }

  Future<Result<DocumentReference<Map<String, dynamic>>>> createMessage(
      ChatApiModel chatApiModel) async {
    try {
      final docRef = await _firebaseFirestore.collection('chat').add({
        'userId': chatApiModel.userId,
        'userName': chatApiModel.userName,
        'text': chatApiModel.text,
        'createdAt': chatApiModel.createdAt,
      });
      return Result.ok(docRef);
    } catch (error) {
      return Result.error(
        Exception('Falha ao criar mensagem. Tente novamente mais tarde.'),
      );
    }
  }
}
