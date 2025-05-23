import 'package:flutter/material.dart';
import 'package:push_notification/routing/routing.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'FlutterChat',
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0x5086F2),
        ),
      ),
      routerConfig: router,
    );
  }
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'FlutterChat',
  //     theme: ThemeData().copyWith(
  //       colorScheme: ColorScheme.fromSeed(
  //         seedColor: const Color(0x5086F2),
  //       ),
  //     ),
  //     home: const Scaffold(
  //       body: Center(
  //         child: AuthScreen(),
  //       ),
  //     ),
  //   );
  // }
}
