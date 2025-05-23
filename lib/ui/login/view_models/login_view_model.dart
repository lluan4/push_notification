import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel();

  bool _isLogin = true;
  bool get isLogin => _isLogin;

  void toggleLogin() {
    _isLogin = !_isLogin;
    notifyListeners();
  }
}
