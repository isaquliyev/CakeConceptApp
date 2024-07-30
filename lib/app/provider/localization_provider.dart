import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/utils/constants.dart';

/// Localization Provider for changing language in application
class LocalizationProvider extends ChangeNotifier {
  final SharedPreferences sharedPreferences;

  LocalizationProvider({required this.sharedPreferences}) {
    _loadCurrentLanguage();
  }

  Locale _locale = const Locale('en', 'EN');

  Locale get locale => _locale;

  void setLanguage(Locale locale) {
    _locale = locale;
    _saveLanguage(_locale);
    notifyListeners();
  }

  _loadCurrentLanguage() async {
    _locale = Locale(sharedPreferences.getString(Constants.LANGUAGE_CODE) ?? 'en', sharedPreferences.getString(Constants.COUNTRY_CODE) ?? 'EN');
    notifyListeners();
  }

  _saveLanguage(Locale locale) async {
    sharedPreferences.setString(Constants.LANGUAGE_CODE, locale.languageCode);
    sharedPreferences.setString(Constants.COUNTRY_CODE, locale.countryCode ?? "EN");
  }
}
