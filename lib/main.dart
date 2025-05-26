import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:push_notification/config/dependencies.dart';
import 'package:push_notification/routing/routing.dart';
import 'package:push_notification/ui/core/themes/button_custom_styles.dart';
import 'package:push_notification/ui/core/themes/input_custom_styles.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: providersRemote, child: const App()));
  // runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'FlutterChat',
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 63, 17, 177),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonCustomStyles.resolve(context),
        ),
        inputDecorationTheme: InputCustomStyles.inputTheme(context),
      ),
      routerConfig: router(context.read()),
      debugShowCheckedModeBanner: false,
    );
  }
}
