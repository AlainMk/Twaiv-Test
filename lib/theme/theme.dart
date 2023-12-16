import 'package:flutter/material.dart';
import 'package:twaiv_test/theme/colors.dart';
import 'package:twaiv_test/theme/fonts.dart';

/// The principle base theme of bof client and business app
class TwaivTheme {
  /// Light default theme color scheme
  static ThemeData light() {
    return ThemeData(
      colorScheme: const ColorScheme.light().copyWith(
        primary: TwaivColors.primary,
        secondary: TwaivColors.secondary,
        error: TwaivColors.red,
      ),
      primaryColor: TwaivColors.primary,
      appBarTheme: const AppBarTheme(
        backgroundColor: TwaivColors.white,
        elevation: 0,
      ),
      textTheme: TwaivFonts.textTheme,
      useMaterial3: false,
    );
  }
}
