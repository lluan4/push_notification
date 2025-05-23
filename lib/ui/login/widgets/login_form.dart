import 'package:flutter/material.dart';
import 'package:push_notification/ui/login/view_models/login_view_model.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key, required this.viewModel});

  final LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final viewModal = viewModel;
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(100),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                  child: Text(
                    viewModal.isLogin ? 'Login' : 'Criar uma conta',
                  ),
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: viewModal.toggleLogin,
                  child: Text(
                    viewModal.isLogin
                        ? "Criar uma conta"
                        : "Já tem uma conta? Login",
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
