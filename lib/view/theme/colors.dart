import 'package:flutter/material.dart';

class UiColors {
  static const Color blue60 = Color(0xFF224BD3);
  static const Color blue50 = Color(0xFF385EDE);
  static const Color blue40 = Color(0xFF6180E5);
  static const Color blue20 = Color(0xFFA7B8F1);
  static const Color blue05 = Color(0xFFDCE3F9);

  static const Color red50 = Color(0xFFE53D33);

  static const Color background = Color(0xFFFFFFFF);

  static const Color backgroundGray = Color(0xFFE6E6E6);
  static const Color outline = Color(0xFF767680);

  static const Color text = Color(0xFF1A1B21);
  static const Color grayText = Color(0x26000000);
}

const colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: UiColors.blue50,
  onPrimary: Colors.white,
  primaryContainer: UiColors.blue05,
  onPrimaryContainer: UiColors.text,
  secondary: UiColors.blue50,
  onSecondary: Colors.white,
  secondaryContainer: UiColors.blue05,
  onSecondaryContainer: UiColors.text,
  error: UiColors.red50,
  onError: Colors.white,
  outline: UiColors.outline,
  outlineVariant: Color(0xFFc4c6d0),
  surface: UiColors.background,
  onSurface: UiColors.text,
  scrim: Colors.black
);

const blueGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    UiColors.blue60,
    UiColors.blue40
  ]
);