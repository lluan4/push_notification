import 'package:go_router/go_router.dart';
import 'package:push_notification/routing/routes.dart';
import 'package:push_notification/ui/login/view_models/login_view_model.dart';
import 'package:push_notification/ui/login/widgets/login_screen.dart';

GoRouter router = GoRouter(
  initialLocation: Routes.login,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Routes.login,
      builder: (context, state) {
        return LoginScreen(
          viewModel: LoginViewModel(),
        );
      },
    ),
  ],
);
