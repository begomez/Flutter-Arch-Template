import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/common/utils/AppLogger.dart';

/*
 * Admitted language codes for application
 */
enum LangCodes { EN, ES }

/*
 * Extension providing additional functionality to previous enum
 */
extension LangCodesExtension on LangCodes {
  String toCode() {
    return this.toString().replaceAll("LangCodes.", "").toLowerCase();
  }
}

/*
 * Translations manager
 */
class AppLocalizations {
  static final String dir = "i18n/";
  static final String ext = ".json";

  final Locale? locale;
  Map<String, String> translations;
  final AppLocalizationsDelegate delegate;
  bool testing;

  AppLocalizations(
      {this.locale,
      this.translations = const {},
      this.delegate = const AppLocalizationsDelegate(),
      this.testing = false});

  static AppLocalizations? of(BuildContext cntxt) =>
      Localizations.of<AppLocalizations>(cntxt, AppLocalizations);

  Future<AppLocalizations> loadTest(Locale locale) async {
    return AppLocalizations(locale: locale);
  }

  Future<AppLocalizations> load() async {
    final json =
        await rootBundle.loadString("$dir${this.locale!.languageCode}$ext");

    Map<String, dynamic> texts = jsonDecode(json);

    this.translations =
        texts.map((key, value) => MapEntry(key, value.toString()));

    return this;
  }

  String? translate(String key) {
    if (testing) return key;

    if (this.translations.containsKey(key)) {
      return this.translations[key];
    } else {
      AppLogger.i(msg: "Not found: $key");
      return key;
    }
  }
}

/*
 * Translations delegate
 */
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  final bool testing;
  const AppLocalizationsDelegate({this.testing = false});

  @override
  bool isSupported(Locale locale) => LangCodes.values
      .map((e) => e.toCode())
      .toList()
      .contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations locals =
        AppLocalizations(locale: locale, testing: testing);
    if (testing) {
      return await locals.loadTest(locale);
    } else {
      return await locals.load();
    }
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
