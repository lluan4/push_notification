import 'package:flutter/foundation.dart';

import 'package:push_notification/utils/result.dart';

abstract class AuthRepository extends ChangeNotifier {
  Future<bool> get isAuthenticated;

  Future<Result<void>> register(
      {required String email, required String password});

  Future<Result<void>> login({required String email, required String password});

  Future<void> logout();
}
