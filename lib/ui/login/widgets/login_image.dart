import 'package:flutter/material.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CircleAvatar(
      radius: 50,
      backgroundColor: theme.colorScheme.surfaceContainerLow,
      child: Image.asset(
        'assets/images/chat.png',
        fit: BoxFit.cover,
        width: 65,
      ),
    );
  }
}
