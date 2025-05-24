import 'package:flutter/material.dart';
import 'package:push_notification/ui/login/view_models/login_view_model.dart';
import 'package:push_notification/ui/login/widgets/login_form.dart';
import 'package:push_notification/ui/login/widgets/login_image.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.viewModel});

  final LoginViewModel viewModel;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final meadiaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Login',
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
            child: LoginForm(
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
