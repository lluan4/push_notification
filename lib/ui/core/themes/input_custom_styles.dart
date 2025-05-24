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
}
