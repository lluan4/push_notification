import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:push_notification/data/repositories/auth/auth_repository.dart';
import 'package:push_notification/data/repositories/auth/auth_repository_remote.dart';
import 'package:push_notification/data/repositories/chat/chat_repository.dart';
import 'package:push_notification/data/repositories/chat/chat_repository_remote.dart';
import 'package:push_notification/data/services/api/api_client.dart';

List<SingleChildWidget> get providersRemote {
  return [
    Provider(create: (_) => ApiClient()),
    ChangeNotifierProvider(
      create: (context) => AuthRepositoryRemote(
        authApiClient: context.read(),
      ) as AuthRepository,
    ),
    ChangeNotifierProvider(
      create: (context) => ChatRepositoryRemote(
        authApiClient: context.read(),
      ) as ChatRepository,
    ),
  ];
}
