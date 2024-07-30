import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/utils/constants.dart';

class AppLocalization {
  Locale? locale;
  AppLocalization({required this.locale});

  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }


  Map<String, String> _localizedValues ={};

  Future<void> load() async {
    String jsonStringValues = await rootBundle.loadString('assets/language/${locale!.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizedValues = mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String translate(String key) {
    return _localizedValues[key] ?? key;
  }

  static const LocalizationsDelegate<AppLocalization> delegate = _DemoLocalizationsDelegate();

}

class _DemoLocalizationsDelegate extends LocalizationsDelegate<AppLocalization> {
  const _DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    List<String> languageString = [];
    for (var language in Constants.languages) {
      languageString.add(language.languageCode!);
    }
    languageString.add(Constants.languages[1].languageCode!);
    return languageString.contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization localization = AppLocalization(locale: locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) => false;
}