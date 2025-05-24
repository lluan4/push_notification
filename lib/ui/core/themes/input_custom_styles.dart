import 'package:flutter/material.dart';

abstract final class InputCustomStyles {
  static final baseDecoration = InputDecoration(
    filled: true,
    contentPadding: const EdgeInsets.symmetric(
      vertical: 4,
      horizontal: 16,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  );

  static InputDecorationTheme inputTheme(BuildContext context) {
    final theme = Theme.of(context);
    return InputDecorationTheme(
      filled: true,
      fillColor: theme.colorScheme.surfaceDim,
      contentPadding: baseDecoration.contentPadding,
      border: baseDecoration.border,
      hintStyle: theme.textTheme.labelLarge?.copyWith(
        color: theme.colorScheme.onSurface.withOpacity(0.5),
      ),
    );
  }

  static InputDecoration inputIsValidDecoration() {
    return baseDecoration.copyWith(
      fillColor: Colors.green.withOpacity(0.1),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.green,
          width: 1,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.green,
          width: 2,
        ),
      ),
      suffixIcon: const Icon(
        Icons.check_circle,
        color: Colors.green,
        size: 20,
      ),
    );
  }

  static InputDecoration inputIsErrorDecoration(BuildContext context) {
    final theme = Theme.of(context);
    return baseDecoration.copyWith(
      fillColor: theme.colorScheme.errorContainer,
      suffixIcon: Icon(
        Icons.error,
        color: theme.colorScheme.error,
        size: 20,
      ),
    );
  }
}
