class ReactiveStyledTextField<T> extends StatelessWidget {
  const ReactiveStyledTextField({
    super.key,
    required this.props,
  });

  final StyledTextFieldProps<T> props;

  @override
  Widget build(BuildContext context) {
    final form = ReactiveForm.of(context)! as FormGroup;
    final control = form.control(props.formControlName);

    InputDecoration decoration = InputCustomStyles.baseDecoration.copyWith(
      hintText: props.hintText,
      prefixIcon: props.prefixIcon,
      suffixIcon: props.suffixIcon,
    );

    if (control.valid && control.touched) {
      decoration = InputCustomStyles.inputIsValidDecoration().copyWith(
        hintText: props.hintText,
        prefixIcon: props.prefixIcon,
        suffixIcon: props.suffixIcon,
      );
    } else if (control.invalid && control.touched) {
      decoration = InputCustomStyles.inputIsErrorDecoration(context).copyWith(
        hintText: props.hintText,
        prefixIcon: props.prefixIcon,
        suffixIcon: props.suffixIcon,
      );
    }

    return ReactiveTextField<T>(
      formControlName: props.formControlName,
      decoration: decoration,
      obscureText: props.obscureText ?? false,
      keyboardType: props.keyboardType,
      textInputAction: props.textInputAction,
      enabled: props.enabled,
      readOnly: props.readOnly ?? false,
      autofocus: props.autofocus ?? false,
      enableSuggestions: props.enableSuggestions,
      autocorrect: props.autocorrect,
      maxLines: props.maxLines,
      minLines: props.minLines,
      textAlign: props.textAlign ?? TextAlign.start,
      style: props.style,
      validationMessages: props.validationMessages,
      onChanged: props.onChanged,
      onSubmitted: props.onSubmitted,
    );
  }
}
