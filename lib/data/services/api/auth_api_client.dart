import 'package:firebase_auth/firebase_auth.dart';
import 'package:push_notification/data/services/models/auth_request/auth_request.dart';

import 'package:push_notification/data/services/models/auth_response/auth_response.dart';

import 'package:push_notification/utils/result.dart';

final _firebaseAuth = FirebaseAuth.instance;

class AuthApiClient {
  Future<Result<AuthResponse>> register(AuthRequest registerRequest) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: registerRequest.email,
        password: registerRequest.password,
      );
      return Result.ok(AuthResponse(userCredential: userCredential));
    } on FirebaseAuthException catch (error) {
      return Result.error(error);
    }
  }

  Future<Result<AuthResponse>> login(AuthRequest loginRequest) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: loginRequest.email,
        password: loginRequest.password,
      );
      return Result.ok(AuthResponse(userCredential: userCredential));
    } on FirebaseAuthException catch (error) {
      return Result.error(error);
    }
  }
}
