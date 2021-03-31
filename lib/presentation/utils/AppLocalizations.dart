import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/presentation/utils/AppLogger.dart';

/**
 * 
 */
enum LangCodes { EN, ES }

/**
 * 
 */
class AppLocalizations {
  final String DIR = "i18n/";
  final String EXTENSION = ".json";

  final Locale locale;
  static AppLocalizationsDelegate delegate;
  Map<String, String> translations;

  AppLocalizations(
      {this.locale,
      this.delegate = const AppLocalizationsDelegate(),
      this.translations = const {}});

  static AppLocalizations of(BuildContext cntxt) =>
      Localizations.of<AppLocalizations>(cntxt, AppLocalizations);

  Future<AppLocalizations> load() async {
    final json = await rootBundle
        .loadString("$DIR${this.locale.languageCode}$EXTENSION");

    Map<String, dynamic> texts = jsonDecode(json);

    this.translations =
        texts.map((key, value) => MapEntry(key, value.toString()));

    return this;
  }

  String translate(String key) {
    if (this.translations.containsKey(key)) {
      return this.translations[key];
    } else {
      AppLogger.i(msg: "Not found: $key");
      return key;
    }
  }
}

/**
 * 
 */
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      LangCodes.values.contains(locale.languageCode.toUpperCase());

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations locals = AppLocalizations(locale: locale);

    return await locals.load();
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
