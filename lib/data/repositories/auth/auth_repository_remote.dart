import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:push_notification/data/repositories/auth/auth_repository.dart';
import 'package:push_notification/data/repositories/auth/auth_status.dart';
import 'package:push_notification/data/services/api/auth_api_client.dart';
import 'package:push_notification/data/services/models/auth_request/auth_request.dart';
import 'package:push_notification/data/services/models/auth_response/auth_response.dart';
import 'package:push_notification/utils/result.dart';

class AuthRepositoryRemote extends AuthRepository {
  AuthRepositoryRemote({required this.authApiClient}) {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        _status = user == null
            ? AuthStatus.unauthenticated
            : AuthStatus.authenticated;
        notifyListeners();
      },
    );
  }

  final AuthApiClient authApiClient;
  AuthStatus _status = AuthStatus.loading;
  bool _isLoggedIn = false;

  @override
  Future<Result<void>> register({
    required String email,
    required String password,
  }) async {
    final result = await authApiClient
        .register(AuthRequest(email: email, password: password));
    switch (result) {
      case Ok<AuthResponse>():
        _setLoggedIn(true);
        return const Result.ok(null);
      case Error<AuthResponse>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<void>> login({
    required String email,
    required String password,
  }) async {
    final result = await authApiClient
        .login(AuthRequest(email: email, password: password));
    switch (result) {
      case Ok<AuthResponse>():
        _setLoggedIn(true);
        return const Result.ok(null);
      case Error<AuthResponse>():
        return Result.error(result.error);
    }
  }

  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    _setLoggedIn(false);
  }

  void _setLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }

  @override
  Future<bool> get isAuthenticated async => _isLoggedIn;

  @override
  AuthStatus get status => _status;
}
