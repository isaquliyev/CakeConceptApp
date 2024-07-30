import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/localization_provider.dart';

final locator = GetIt.instance;

class Injection {
  static register() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    locator.registerLazySingleton(() => sharedPreferences);

    locator.registerLazySingleton(() => GlobalKey<NavigatorState>());

    locator.registerFactory(
            () => LocalizationProvider(sharedPreferences: (locator())));
  }
}