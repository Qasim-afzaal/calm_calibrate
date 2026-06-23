import 'package:flutter/material.dart';
import 'package:calm_calibrate/l10n/app_localizations.dart';

/// Stored in [AppCache] when the user picks "follow device".
const localeSystemCode = 'system';

class AppLocaleOption {
  const AppLocaleOption({
    required this.code,
    required this.nativeName,
  });

  /// `system` follows the device locale; otherwise ISO language code.
  final String code;
  final String nativeName;

  Locale? get locale =>
      code == localeSystemCode ? null : Locale.fromSubtags(languageCode: code);
}

/// All selectable app languages.
const appLocaleOptions = [
  AppLocaleOption(code: localeSystemCode, nativeName: 'System'),
  AppLocaleOption(code: 'en', nativeName: 'English'),
  AppLocaleOption(code: 'ur', nativeName: 'اردو'),
  AppLocaleOption(code: 'hi', nativeName: 'हिन्दी'),
  AppLocaleOption(code: 'bn', nativeName: 'বাংলা'),
  AppLocaleOption(code: 'es', nativeName: 'Español'),
  AppLocaleOption(code: 'fr', nativeName: 'Français'),
  AppLocaleOption(code: 'ar', nativeName: 'العربية'),
  AppLocaleOption(code: 'pt', nativeName: 'Português'),
  AppLocaleOption(code: 'de', nativeName: 'Deutsch'),
];

AppLocaleOption? appLocaleOptionForCode(String code) {
  for (final option in appLocaleOptions) {
    if (option.code == code) return option;
  }
  return null;
}

String appLocaleDisplayName(String code, AppLocalizations l10n) =>
    switch (code) {
      'en' => l10n.localeEnglish,
      'ur' => l10n.localeUrdu,
      'hi' => l10n.localeHindi,
      'bn' => l10n.localeBengali,
      'es' => l10n.localeSpanish,
      'fr' => l10n.localeFrench,
      'ar' => l10n.localeArabic,
      'pt' => l10n.localePortuguese,
      'de' => l10n.localeGerman,
      _ => l10n.systemDefault,
    };
