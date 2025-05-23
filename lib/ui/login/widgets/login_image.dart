import 'package:flutter/material.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 120,
        bottom: 40,
        left: 20,
        right: 20,
      ),
      width: 100,
      child: Image.asset(
        'assets/images/chat.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
