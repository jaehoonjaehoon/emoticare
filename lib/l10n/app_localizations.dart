import 'dart:convert';
import 'package:emoticare/main.dart';
import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  Map<String, String> _localizedStrings = {};

  Future<bool> load(BuildContext context) async {
    final String jsonString = await DefaultAssetBundle.of(context)
        .loadString('lib/l10n/intl_${locale.languageCode}.arb');
    _localizedStrings = Map<String, String>.from(json.decode(jsonString));
    return true;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ko', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load(navigatorKey.currentContext!);
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate old) => false;
}
