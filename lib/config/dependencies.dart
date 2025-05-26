import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:push_notification/data/repositories/auth/auth_repository.dart';
import 'package:push_notification/data/repositories/auth/auth_repository_remote.dart';
import 'package:push_notification/data/services/api/auth_api_client.dart';

List<SingleChildWidget> get providersRemote {
  return [
    Provider(create: (_) => AuthApiClient()),
    ChangeNotifierProvider(
      create: (context) => AuthRepositoryRemote(
        authApiClient: context.read(),
      ) as AuthRepository,
    ),
  ];
}
