import 'package:go_router/go_router.dart';
import 'package:push_notification/routing/routes.dart';
import 'package:push_notification/ui/login/view_models/login_view_model.dart';
import 'package:push_notification/ui/login/widgets/login_screen.dart';
import 'package:push_notification/ui/register/view_models/register_view_model.dart';

import 'package:push_notification/ui/register/widgets/register_screen.dart';

GoRouter router = GoRouter(
  initialLocation: Routes.login,
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      path: Routes.login,
      name: 'login',
      builder: (context, state) {
        return LoginScreen(
          viewModel: LoginViewModel(),
        );
      },
    ),
    GoRoute(
      path: Routes.register,
      name: 'register',
      builder: (context, state) {
        return RegisterScreen(
          viewModel: RegisterViewModel(),
        );
      },
    ),
  ],
);
