import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:push_notification/ui/core/themes/input_custom_styles.dart';

import 'package:push_notification/ui/register/view_models/register_view_model.dart';
import 'package:push_notification/utils/input_decarotion.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key, required this.viewModel});

  final RegisterViewModel viewModel;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final meadiaQuery = MediaQuery.of(context);
    final FormGroup form = widget.viewModel.form;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      height: meadiaQuery.size.height * 0.84,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 42,
            vertical: 72,
          ),
          child: ReactiveForm(
            formGroup: form,
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: theme.textTheme.labelMedium,
                    textAlign: TextAlign.start,
                  ),
                  ReactiveStatusListenableBuilder(
                    formControlName: 'email',
                    builder: (context, status, child) {
                      final form = ReactiveForm.of(context)! as FormGroup;
                      final control = form.control('email');

                      return ReactiveTextField<String>(
                        formControlName: 'email',
                        decoration: styledDecoration(
                          context: context,
                          control: control,
                          hintText: 'teste@gmail.com',
                          prefixIcon: const Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        textInputAction: TextInputAction.next,
                        validationMessages: {
                          ValidationMessage.required: (_) =>
                              'O email é obrigatório.',
                          ValidationMessage.email: (_) => 'Email inválido',
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Confirmar Email',
                    style: theme.textTheme.labelMedium,
                    textAlign: TextAlign.start,
                  ),
                  ReactiveStatusListenableBuilder(
                    formControlName: 'confirmEmail',
                    builder: (context, status, child) {
                      final form = ReactiveForm.of(context)! as FormGroup;
                      final control = form.control('confirmEmail');

                      return ReactiveTextField<String>(
                        formControlName: 'confirmEmail',
                        decoration: styledDecoration(
                          context: context,
                          control: control,
                          hintText: 'teste@gmail.com',
                          prefixIcon: const Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        textInputAction: TextInputAction.next,
                        validationMessages: {
                          ValidationMessage.required: (_) =>
                              'O email é obrigatório.',
                          'mustMatchOnBlur': (_) => 'Os emails não conferem',
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Senha',
                    style: theme.textTheme.labelMedium,
                    textAlign: TextAlign.start,
                  ),
                  ReactiveTextField<String>(
                    formControlName: 'password',
                    obscureText: !passwordVisible,
                    decoration: InputDecoration(
                      hintText: '123@Senha',
                      prefixIcon: const Icon(Icons.lock),
                      prefixIconColor: theme.colorScheme.onSurface,
                      suffixIconColor: theme.colorScheme.onSurface,
                      suffixIcon: IconButton(
                        icon: Icon(
                          passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    validationMessages: {
                      ValidationMessage.required: (_) => 'Senha é obrigatório',
                      ValidationMessage.minLength: (_) => 'Mínimo 8 caracteres',
                    },
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Confirmar Senha',
                    style: theme.textTheme.labelMedium,
                    textAlign: TextAlign.start,
                  ),
                  ReactiveTextField<String>(
                    formControlName: 'confirmPassword',
                    obscureText: !confirmPasswordVisible,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      prefixIconColor: theme.colorScheme.onSurface,
                      suffixIconColor: theme.colorScheme.onSurface,
                      suffixIcon: IconButton(
                        icon: Icon(
                          confirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () => setState(() {
                          confirmPasswordVisible = !confirmPasswordVisible;
                        }),
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                    validationMessages: {
                      ValidationMessage.required: (_) =>
                          'Confirmação obrigatória',
                      'mustMatchOnBlur': (_) => 'As senhas não conferem',
                    },
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.primary,
                          foregroundColor: theme.colorScheme.onPrimary,
                        ),
                        child: const Text(
                          'Criar uma conta',
                        )),
                  ),
                  const SizedBox(height: 12),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: 'Já tem uma conta? '),
                            TextSpan(
                              text: "Login",
                              style: TextStyle(
                                color: theme.colorScheme.primary,
                                fontSize: theme.textTheme.bodyLarge?.fontSize,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => context.pop(),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
