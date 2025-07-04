import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:push_notification/routing/routes.dart';

import 'package:push_notification/ui/register/view_models/register_view_model.dart';

import 'package:reactive_forms/reactive_forms.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key, required this.viewModel});

  final RegisterViewModel viewModel;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final FormGroup form = widget.viewModel.form;

    void onSubmit() async {
      if (!form.valid) {
        form.markAllAsTouched();
        return;
      }
      if (!context.mounted) return;

      final scaffoldMessengerContext = ScaffoldMessenger.of(context);
      final email = form.control('email').value;
      final password = form.control('password').value;
      final userName = form.control('userName').value;

      final result = await widget.viewModel.submit((email, password, userName));

      if (result == null) {
        scaffoldMessengerContext.clearSnackBars();
        scaffoldMessengerContext.showSnackBar(
          SnackBar(
            backgroundColor: Colors.green.shade700,
            content: const Text('Conta criada com sucesso!'),
          ),
        );
        if (context.mounted) context.go(Routes.login);
        return;
      }

      scaffoldMessengerContext.clearSnackBars();
      scaffoldMessengerContext.showSnackBar(
        SnackBar(
          content: Text(result),
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
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nome',
                  style: theme.textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                ReactiveTextField<String>(
                  formControlName: 'userName',
                  decoration: InputDecoration(
                    hintText: 'Digite como quer ser chamado',
                    prefixIcon: const Icon(Icons.person),
                    prefixIconColor: theme.colorScheme.onSurface,
                  ),
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.next,
                  enableSuggestions: false,
                  validationMessages: {
                    ValidationMessage.required: (_) => 'O nome é obrigatório.',
                    ValidationMessage.minLength: (_) =>
                        'O nome deve ter no mínimo 3 caracteres.',
                  },
                ),
                const SizedBox(height: 12),
                Text(
                  'Email',
                  style: theme.textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                ReactiveTextField<String>(
                  formControlName: 'email',
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
                  'Confirmar Email',
                  style: theme.textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                ReactiveTextField<String>(
                  formControlName: 'confirmEmail',
                  decoration: InputDecoration(
                    hintText: 'Digite seu email novamente',
                    prefixIcon: const Icon(Icons.email),
                    prefixIconColor: theme.colorScheme.onSurface,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.next,
                  validationMessages: {
                    ValidationMessage.required: (_) => 'O email é obrigatório.',
                    'mustMatchOnBlur': (_) => 'Os emails não conferem',
                  },
                ),
                const SizedBox(height: 12),
                Text(
                  'Senha',
                  style: theme.textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                ReactiveTextField<String>(
                  formControlName: 'password',
                  obscureText: !passwordVisible,
                  decoration: InputDecoration(
                    hintText: 'Digite sua senha',
                    prefixIcon: const Icon(Icons.lock),
                    prefixIconColor: theme.colorScheme.onSurface,
                    suffixIconColor: theme.colorScheme.onSurface,
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
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
                Text(
                  'Confirmar Senha',
                  style: theme.textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                ReactiveTextField<String>(
                  formControlName: 'confirmPassword',
                  obscureText: !confirmPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Digite sua senha novamente',
                    prefixIcon: const Icon(Icons.lock),
                    prefixIconColor: theme.colorScheme.onSurface,
                    suffixIconColor: theme.colorScheme.onSurface,
                    suffixIcon: IconButton(
                      icon: Icon(
                        confirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () => setState(() {
                        confirmPasswordVisible = !confirmPasswordVisible;
                      }),
                    ),
                  ),
                  textInputAction: TextInputAction.done,
                  validationMessages: {
                    ValidationMessage.required: (_) =>
                        'Confirmação obrigatória',
                    'mustMatchOnBlur': (_) => 'As senhas não conferem',
                  },
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: onSubmit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: theme.colorScheme.onPrimary,
                      ),
                      child: const Text(
                        'Criar uma conta',
                      )),
                ),
                const SizedBox(height: 12),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(text: 'Já tem uma conta? '),
                          TextSpan(
                            text: "Login",
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                              fontSize: theme.textTheme.bodyLarge?.fontSize,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => context.pop(),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
