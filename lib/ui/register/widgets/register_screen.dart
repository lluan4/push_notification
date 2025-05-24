import 'package:flutter/material.dart';

import 'package:push_notification/ui/login/widgets/login_image.dart';
import 'package:push_notification/ui/register/view_models/register_view_model.dart';
import 'package:push_notification/ui/register/widgets/register_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.viewModel});

  final RegisterViewModel viewModel;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final meadiaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        iconTheme: IconThemeData(
          color: theme.colorScheme.onPrimary,
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Criar Conta',
          style: TextStyle(
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: RegisterForm(
              viewModel: widget.viewModel,
            ),
          ),
          Positioned(
            top: meadiaQuery.size.height * 0.02,
            left: meadiaQuery.size.width * 0.38,
            child: const LoginImage(),
          ),
        ],
      ),
    );
  }
}
