import 'package:flutter/material.dart';

import 'package:push_notification/data/repositories/auth/auth_status.dart';
import 'package:push_notification/data/services/api/models/auth_request/auth_request.dart';

import 'package:push_notification/utils/result.dart';

abstract class AuthRepository extends ChangeNotifier {
  Future<bool> get isAuthenticated;
  AuthStatus get status;
  dynamic get authenticatedUser;

  Future<Result<void>> register(AuthRequest request);

  Future<Result<void>> login({
    required String email,
    required String password,
  });

  Future<void> logout();
}
