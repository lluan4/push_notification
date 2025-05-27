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
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: meadiaQuery.size.height * 0.75,
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: RegisterForm(
                  viewModel: widget.viewModel,
                ),
              ),
              Positioned(
                top: -50,
                left: (meadiaQuery.size.width * 0.5) - 50,
                child: const LoginImage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
