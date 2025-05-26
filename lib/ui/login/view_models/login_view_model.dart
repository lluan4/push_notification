import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

abstract final class LoginFormControlsName {
  static const String email = 'email';

  static const String password = '/register';
}

class LoginViewModel extends ChangeNotifier {
  LoginViewModel();

  FormGroup get form => _form;
  final FormGroup _form = FormGroup(
    {
      LoginFormControlsName.email: FormControl<String>(
        validators: [Validators.required, Validators.email],
      ),
      LoginFormControlsName.password: FormControl<String>(
        validators: [Validators.required, Validators.minLength(8)],
      ),
    },
  );

  void submit() {
    if (!form.valid) {
      print('Form is invalid');
      form.markAllAsTouched();

      return;
    }
    print('Form submitted successfully');
    print('Email: ${form.control('email').value}');
    print('Password: ${form.control('password').value}');
  }

  @override
  void dispose() {
    _form.dispose();
    super.dispose();
  }
}
