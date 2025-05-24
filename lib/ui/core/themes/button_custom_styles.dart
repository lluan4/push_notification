import 'package:flutter/material.dart';

abstract final class ButtonCustomStyles {
  static final base = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    padding: const EdgeInsets.symmetric(
      vertical: 4,
      horizontal: 16,
    ),
  );

  static ButtonStyle resolve(BuildContext context) {
    final defaultStyle = Theme.of(context).elevatedButtonTheme.style;
    return defaultStyle?.copyWith(
          shape: base.shape,
          padding: base.padding,
        ) ??
        base;
  }
}
