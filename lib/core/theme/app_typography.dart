import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Poppins — the app-wide font family.
abstract final class AppTypography {
  static String? get fontFamily => GoogleFonts.poppins().fontFamily;

  static TextTheme textTheme(Brightness brightness) {
    return GoogleFonts.poppinsTextTheme(
      ThemeData(brightness: brightness).textTheme,
    );
  }

  static TextStyle poppins([TextStyle? base]) => GoogleFonts.poppins(textStyle: base);

  static TextStyle style({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );
  }
}

extension AppTypographyContext on BuildContext {
  /// Merge [base] with Poppins (use for one-off TextStyle overrides).
  TextStyle poppinsText([TextStyle? base]) => AppTypography.poppins(base);
}
