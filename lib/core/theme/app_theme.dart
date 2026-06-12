import 'package:calm_calibrate/core/theme/app_color_tokens.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTheme {
  static ThemeData get light => _build(AppColorTokens.light, Brightness.light);

  static ThemeData get dark => _build(AppColorTokens.dark, Brightness.dark);

  static ThemeData _build(AppColorTokens tokens, Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final textTheme = GoogleFonts.interTextTheme(
      ThemeData(brightness: brightness).textTheme,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: tokens.background,
      extensions: [tokens],
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: tokens.primary,
        onPrimary: Colors.white,
        secondary: tokens.navy,
        onSecondary: tokens.onNavy,
        surface: tokens.surface,
        onSurface: tokens.textPrimary,
        error: tokens.scoreLow,
        onError: Colors.white,
        outline: tokens.border,
      ),
      textTheme: textTheme.copyWith(
        headlineLarge: textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.w800,
          color: tokens.textPrimary,
          fontSize: 32,
          height: 1.15,
        ),
        headlineMedium: textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.w700,
          color: tokens.textPrimary,
          fontSize: 24,
        ),
        headlineSmall: textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w800,
          color: tokens.textPrimary,
        ),
        titleLarge: textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w700,
          color: tokens.textPrimary,
          fontSize: 20,
        ),
        titleMedium: textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: tokens.textPrimary,
          fontSize: 16,
        ),
        bodyLarge: textTheme.bodyLarge?.copyWith(
          color: tokens.textSecondary,
          fontSize: 16,
          height: 1.5,
        ),
        bodyMedium: textTheme.bodyMedium?.copyWith(
          color: tokens.textSecondary,
          fontSize: 14,
        ),
        labelLarge: textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: tokens.textPrimary,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: tokens.background,
        foregroundColor: tokens.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: tokens.textPrimary),
        titleTextStyle: textTheme.titleLarge?.copyWith(
          color: tokens.textPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: tokens.surface,
        indicatorColor: tokens.primaryLight,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          return TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: states.contains(WidgetState.selected)
                ? tokens.primary
                : tokens.textMuted,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          return IconThemeData(
            color: states.contains(WidgetState.selected)
                ? tokens.primary
                : tokens.textMuted,
          );
        }),
      ),
      dividerColor: tokens.border,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: tokens.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: tokens.textPrimary,
          side: BorderSide(color: tokens.border),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: tokens.surface,
        elevation: isDark ? 0 : 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: tokens.border),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: tokens.surface,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          color: tokens.textPrimary,
        ),
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: tokens.textSecondary,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: tokens.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(Colors.white),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return tokens.primary;
          }
          return tokens.border;
        }),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: tokens.surface,
        selectedColor: tokens.primaryLight,
        labelStyle: TextStyle(color: tokens.textPrimary),
        side: BorderSide(color: tokens.border),
        checkmarkColor: tokens.primary,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: tokens.primary,
        linearTrackColor: tokens.border,
      ),
      iconTheme: IconThemeData(color: tokens.textPrimary),
    );
  }
}
