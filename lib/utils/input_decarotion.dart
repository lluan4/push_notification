import 'package:flutter/material.dart';
import 'package:push_notification/ui/core/themes/input_custom_styles.dart';
import 'package:reactive_forms/reactive_forms.dart';

InputDecoration styledDecoration({
  required BuildContext context,
  required AbstractControl<dynamic> control,
  String? hintText,
  Widget? prefixIcon,
}) {
  InputDecoration decoration = InputCustomStyles.baseDecoration.copyWith(
    hintText: hintText,
    prefixIcon: prefixIcon,
  );

  if (control.valid) {
    decoration = InputCustomStyles.inputIsValidDecoration().copyWith(
      prefixIcon: prefixIcon,
    );
  }

  if (control.hasError('email') && control.touched) {
    decoration = InputCustomStyles.inputIsErrorDecoration(context).copyWith(
      hintText: hintText,
      prefixIcon: prefixIcon,
    );
  }

  return decoration;
}
