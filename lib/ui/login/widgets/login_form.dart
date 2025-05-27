import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:push_notification/routing/routes.dart';
import 'package:push_notification/ui/login/view_models/login_view_model.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.viewModel});

  final LoginViewModel viewModel;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final viewModal = widget.viewModel;
    final theme = Theme.of(context);
    final FormGroup form = viewModal.form;

    void handleLogin() async {
      if (!form.valid) {
        form.markAllAsTouched();
        return;
      }
      if (!context.mounted) return;

      final scaffoldMessager = ScaffoldMessenger.of(context);
      final email = form.control(LoginFormControlsName.email).value;
      final password = form.control(LoginFormControlsName.password).value;
      final errorMessage = await viewModal.submit((email, password));

      if (errorMessage == null) return;

      scaffoldMessager.showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: theme.colorScheme.error,
        ),
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 72,
        ),
        child: ReactiveForm(
          formGroup: form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email',
                style: theme.textTheme.labelMedium,
                textAlign: TextAlign.start,
              ),
              ReactiveTextField<String>(
                formControlName: LoginFormControlsName.email,
                decoration: InputDecoration(
                  hintText: 'Digite seu email',
                  prefixIcon: const Icon(Icons.email),
                  prefixIconColor: theme.colorScheme.onSurface,
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.none,
                textInputAction: TextInputAction.next,
                validationMessages: {
                  ValidationMessage.required: (_) => 'O email é obrigatório.',
                  ValidationMessage.email: (_) => 'O email deve ser válido.',
                },
              ),
              const SizedBox(height: 12),
              Text(
                'Senha',
                style: theme.textTheme.labelMedium,
                textAlign: TextAlign.start,
              ),
              ReactiveTextField<String>(
                formControlName: LoginFormControlsName.password,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  hintText: 'Digite sua senha',
                  prefixIcon: const Icon(Icons.lock),
                  prefixIconColor: theme.colorScheme.onSurface,
                  suffixIconColor: theme.colorScheme.onSurface,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                textInputAction: TextInputAction.next,
                validationMessages: {
                  ValidationMessage.required: (_) => 'Senha é obrigatório',
                  ValidationMessage.minLength: (_) => 'Mínimo 8 caracteres',
                },
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                  ),
                  child: const Text(
                    'Login',
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(text: "Não tem uma conta? "),
                      TextSpan(
                        text: "Criar uma conta",
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontSize: theme.textTheme.bodyLarge?.fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.push(Routes.register),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
