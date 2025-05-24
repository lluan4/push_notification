import 'package:reactive_forms/reactive_forms.dart';

class MatchAndLength extends Validator<dynamic> {
  MatchAndLength(this.src, this.dst);

  final String src;
  final String dst;

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final fg = control as FormGroup;
    final aVal = fg.control(src).value?.toString() ?? '';
    final b = fg.control(dst);
    final bVal = b.value?.toString() ?? '';

    b.removeError('mustMatch');
    b.removeError('isBiggerThan');

    if (!b.touched) return null;

    if (aVal != bVal || bVal.length >= aVal.length) {
      b.setErrors({'matchAndLength': true});
      return null;
    }
    b.removeError('matchAndLength');

    return null;
  }
}

abstract final class CustomValidators {
  static Validator<dynamic> matchAndLength(
          String controlName, String matchingControlName) =>
      MatchAndLength(controlName, matchingControlName);
}
