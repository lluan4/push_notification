import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel();

  FormGroup get form => _form;
  final FormGroup _form = FormGroup(
    {
      'email': FormControl<String>(
        validators: [Validators.required, Validators.email],
      ),
      'password': FormControl<String>(
        validators: [Validators.required, Validators.minLength(8)],
      ),
    },
  );

  @override
  void dispose() {
    _form.dispose();
    super.dispose();
  }
}
