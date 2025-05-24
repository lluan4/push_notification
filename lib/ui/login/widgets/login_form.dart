import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:push_notification/routing/routes.dart';
import 'package:push_notification/ui/login/view_models/login_view_model.dart';

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
    final meadiaQuery = MediaQuery.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      height: meadiaQuery.size.height * 0.84,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 42,
            vertical: 72,
          ),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email',
                  style: theme.textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'teste@gmail.com',
                    prefixIcon: const Icon(Icons.email),
                    prefixIconColor: theme.colorScheme.onSurface,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 12),
                Text(
                  'Senha',
                  style: theme.textTheme.labelMedium,
                  textAlign: TextAlign.start,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: '123@Senha',
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
                  obscureText: !_passwordVisible,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 12),
                SizedBox(
                  key: ValueKey(viewModal.isLogin),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
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
      ),
    );
  }
}
