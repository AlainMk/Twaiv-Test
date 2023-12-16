import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class TwaivFonts {
  const TwaivFonts._();

  static TextTheme textTheme = TextTheme(
    headlineLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      color: TwaivColors.darkerText,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      color: TwaivColors.darkerText,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      color: TwaivColors.darkerText,
    ),
    titleLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: TwaivColors.darkerText,
      fontSize: 20,
    ),
    titleMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: TwaivColors.darkerText,
      fontSize: 16,
    ),
    titleSmall: GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      color: TwaivColors.darkText,
      fontSize: 14,
    ),
    labelLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: TwaivColors.darkText,
    ),
    labelMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: TwaivColors.darkText,
    ),
    labelSmall: GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      color: TwaivColors.lightText,
    ),
    bodyLarge: GoogleFonts.poppins(
      color: TwaivColors.darkText,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    bodyMedium: GoogleFonts.poppins(
      color: TwaivColors.darkerText,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    bodySmall: GoogleFonts.poppins(
      color: TwaivColors.lightText,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
  );
}
