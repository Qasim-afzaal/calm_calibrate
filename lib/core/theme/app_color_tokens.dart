import 'package:flutter/material.dart';

/// Semantic colors — use via [BuildContext.appColors] for light/dark support.
@immutable
class AppColorTokens extends ThemeExtension<AppColorTokens> {
  const AppColorTokens({
    required this.background,
    required this.surface,
    required this.primary,
    required this.primaryLight,
    required this.navy,
    required this.navyLight,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.border,
    required this.success,
    required this.successLight,
    required this.warning,
    required this.scoreLow,
    required this.scoreMid,
    required this.scoreHigh,
    required this.painHotspot,
    required this.cardShadow,
    required this.onNavy,
  });

  final Color background;
  final Color surface;
  final Color primary;
  final Color primaryLight;
  final Color navy;
  final Color navyLight;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color border;
  final Color success;
  final Color successLight;
  final Color warning;
  final Color scoreLow;
  final Color scoreMid;
  final Color scoreHigh;
  final Color painHotspot;
  final Color cardShadow;
  final Color onNavy;

  static const light = AppColorTokens(
    background: Color(0xFFF8F9FB),
    surface: Color(0xFFFFFFFF),
    primary: Color(0xFFE85D3B),
    primaryLight: Color(0xFFFFF0EC),
    navy: Color(0xFF1A2B48),
    navyLight: Color(0xFF2D3F5C),
    textPrimary: Color(0xFF1A2B48),
    textSecondary: Color(0xFF6B7A90),
    textMuted: Color(0xFF9AA8B8),
    border: Color(0xFFE8ECF1),
    success: Color(0xFF2ECC71),
    successLight: Color(0xFFE8F8EF),
    warning: Color(0xFFF39C12),
    scoreLow: Color(0xFFE85D3B),
    scoreMid: Color(0xFFF39C12),
    scoreHigh: Color(0xFF2ECC71),
    painHotspot: Color(0xFFE85D3B),
    cardShadow: Color(0x0F1A2B48),
    onNavy: Colors.white,
  );

  static const dark = AppColorTokens(
    background: Color(0xFF0E1218),
    surface: Color(0xFF1A2332),
    primary: Color(0xFFE85D3B),
    primaryLight: Color(0xFF3D2820),
    navy: Color(0xFF1A2B48),
    navyLight: Color(0xFF243044),
    textPrimary: Color(0xFFF0F4F8),
    textSecondary: Color(0xFF9AA8B8),
    textMuted: Color(0xFF6B7A90),
    border: Color(0xFF2D3A4D),
    success: Color(0xFF2ECC71),
    successLight: Color(0xFF1A3D28),
    warning: Color(0xFFF39C12),
    scoreLow: Color(0xFFE85D3B),
    scoreMid: Color(0xFFF39C12),
    scoreHigh: Color(0xFF2ECC71),
    painHotspot: Color(0xFFE85D3B),
    cardShadow: Color(0x40000000),
    onNavy: Colors.white,
  );

  @override
  AppColorTokens copyWith({
    Color? background,
    Color? surface,
    Color? primary,
    Color? primaryLight,
    Color? navy,
    Color? navyLight,
    Color? textPrimary,
    Color? textSecondary,
    Color? textMuted,
    Color? border,
    Color? success,
    Color? successLight,
    Color? warning,
    Color? scoreLow,
    Color? scoreMid,
    Color? scoreHigh,
    Color? painHotspot,
    Color? cardShadow,
    Color? onNavy,
  }) {
    return AppColorTokens(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      primary: primary ?? this.primary,
      primaryLight: primaryLight ?? this.primaryLight,
      navy: navy ?? this.navy,
      navyLight: navyLight ?? this.navyLight,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textMuted: textMuted ?? this.textMuted,
      border: border ?? this.border,
      success: success ?? this.success,
      successLight: successLight ?? this.successLight,
      warning: warning ?? this.warning,
      scoreLow: scoreLow ?? this.scoreLow,
      scoreMid: scoreMid ?? this.scoreMid,
      scoreHigh: scoreHigh ?? this.scoreHigh,
      painHotspot: painHotspot ?? this.painHotspot,
      cardShadow: cardShadow ?? this.cardShadow,
      onNavy: onNavy ?? this.onNavy,
    );
  }

  @override
  AppColorTokens lerp(ThemeExtension<AppColorTokens>? other, double t) {
    if (other is! AppColorTokens) return this;
    return AppColorTokens(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      primaryLight: Color.lerp(primaryLight, other.primaryLight, t)!,
      navy: Color.lerp(navy, other.navy, t)!,
      navyLight: Color.lerp(navyLight, other.navyLight, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      border: Color.lerp(border, other.border, t)!,
      success: Color.lerp(success, other.success, t)!,
      successLight: Color.lerp(successLight, other.successLight, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      scoreLow: Color.lerp(scoreLow, other.scoreLow, t)!,
      scoreMid: Color.lerp(scoreMid, other.scoreMid, t)!,
      scoreHigh: Color.lerp(scoreHigh, other.scoreHigh, t)!,
      painHotspot: Color.lerp(painHotspot, other.painHotspot, t)!,
      cardShadow: Color.lerp(cardShadow, other.cardShadow, t)!,
      onNavy: Color.lerp(onNavy, other.onNavy, t)!,
    );
  }
}

extension AppColorTokensContext on BuildContext {
  AppColorTokens get appColors =>
      Theme.of(this).extension<AppColorTokens>() ?? AppColorTokens.light;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
