import 'package:flutter/material.dart';

import 'package:reactive_forms/reactive_forms.dart';

class RegisterViewModel extends ChangeNotifier {
  RegisterViewModel();

  FormGroup get form => _form;

  final FormGroup _form = FormGroup(
    {
      'email': FormControl<String>(
        validators: [Validators.required, Validators.email],
      ),
      'confirmEmail': FormControl<String>(
        validators: [Validators.required],
      ),
      'password': FormControl<String>(
        validators: [Validators.required, Validators.minLength(8)],
      ),
      'confirmPassword': FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
    },
    validators: [
      Validators.mustMatch('email', 'confirmEmail', markAsDirty: false),
      Validators.mustMatch('password', 'confirmPassword', markAsDirty: false),
    ],
  );

  @override
  void dispose() {
    _form.dispose();
    super.dispose();
  }
}
