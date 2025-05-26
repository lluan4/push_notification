import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:push_notification/data/repositories/auth/auth_repository.dart';
import 'package:push_notification/data/repositories/auth/auth_status.dart';
import 'package:push_notification/routing/routes.dart';
import 'package:push_notification/ui/chat/view_models/chat_view_model.dart';
import 'package:push_notification/ui/chat/widgets/chat_screen.dart';
import 'package:push_notification/ui/core/widgets/splash_screen.dart';
import 'package:push_notification/ui/login/view_models/login_view_model.dart';
import 'package:push_notification/ui/login/widgets/login_screen.dart';
import 'package:push_notification/ui/register/view_models/register_view_model.dart';
import 'package:push_notification/ui/register/widgets/register_screen.dart';

GoRouter router(AuthRepository authRepository) => GoRouter(
      initialLocation: Routes.login,
      debugLogDiagnostics: true,
      redirect: _redirect,
      refreshListenable: authRepository,
      routes: [
        GoRoute(
          path: Routes.splash,
          builder: (context, state) {
            return const SplashScreen();
          },
        ),
        GoRoute(
          path: Routes.login,
          builder: (context, state) {
            return LoginScreen(
              viewModel: LoginViewModel(
                authRepository: context.read(),
              ),
            );
          },
        ),
        GoRoute(
          path: Routes.register,
          builder: (context, state) {
            return RegisterScreen(
              viewModel: RegisterViewModel(
                authRepository: context.read(),
              ),
            );
          },
        ),
        GoRoute(
          path: Routes.chat,
          name: 'chat',
          builder: (context, state) {
            return ChatScreen(
              viewModel: ChatViewModel(
                authRepository: context.read(),
              ),
            );
          },
        ),
      ],
    );

Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  final repo = context.read<AuthRepository>();
  final loggedIn = await repo.isAuthenticated;
  final loggingIn = state.matchedLocation == Routes.login;
  final loading = repo.status == AuthStatus.loading;

  if (loading) return Routes.splash;
  if (!loggedIn) return Routes.login;
  if (loggingIn) return Routes.chat;

  return null;
}
