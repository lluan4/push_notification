import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:push_notification/data/repositories/auth/auth_repository.dart';
import 'package:push_notification/utils/custom_validators.dart';
import 'package:push_notification/utils/result.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegisterViewModel extends ChangeNotifier {
  RegisterViewModel({required this.authRepository});

  AuthRepository authRepository;

  get form => _form;
  final FormGroup _form = FormGroup(
    {
      'email': FormControl<String>(
        validators: [Validators.required, Validators.email],
      ),
      'confirmEmail': FormControl<String>(
        validators: [Validators.required],
      ),
      'password': FormControl<String>(
        validators: [Validators.required, Validators.minLength(8)],
      ),
      'confirmPassword': FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
    },
    validators: [
      CustomValidators.mustMatchOnBlur('password', 'confirmPassword'),
      CustomValidators.mustMatchOnBlur('email', 'confirmEmail')
    ],
  );

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
