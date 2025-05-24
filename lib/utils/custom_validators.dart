import 'package:reactive_forms/reactive_forms.dart';

class MustMatchValidatorOnBlur extends Validator<dynamic> {
  final String controlName;
  final String matchingControlName;

  MustMatchValidatorOnBlur({
    required this.controlName,
    required this.matchingControlName,
  }) : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final form = control as FormGroup;

    final formControl = form.control(controlName);
    final matchingFormControl =
        form.control(matchingControlName) as FormControl;

    if (!matchingFormControl.hasFocus && !matchingFormControl.touched) {
      return null;
    }

    if (formControl.value != matchingFormControl.value) {
      matchingFormControl.setErrors({'mustMatchOnBlur': true});
    } else {
      matchingFormControl.removeError('mustMatchOnBlur');
    }

    return null;
  }
}

abstract final class CustomValidators {
  static Validator<dynamic> mustMatchOnBlur(
          String controlName, String matchingControlName) =>
      MustMatchValidatorOnBlur(
          controlName: controlName, matchingControlName: matchingControlName);
}
