import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:push_notification/data/repositories/auth/auth_repository.dart';
import 'package:push_notification/utils/result.dart';

class RegisterViewModel extends ChangeNotifier {
  RegisterViewModel({required this.authRepository});

  AuthRepository authRepository;

  Future<String?> submit((String, String) credentials) async {
    final (email, password) = credentials;

    final result = await authRepository.register(
      email: email,
      password: password,
    );

    switch (result) {
      case Ok():
        return null;

      case Error(:final error):
        if (error is FirebaseAuthException) {
          return switch (error.code) {
            'user-not-found' => 'Usuário não encontrado.',
            'wrong-password' => 'Senha incorreta.',
            'invalid-email' => 'E-mail inválido.',
            'email-already-in-use' => 'E-mail já em uso.',
            _ => error.message ?? 'Erro desconhecido',
          };
        } else {
          return 'Erro inesperado: $error';
        }
    }
  }
}
