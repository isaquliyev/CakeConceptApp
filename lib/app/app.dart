import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:cake_concept_app/app/constants/app_durations.dart';
import 'package:cake_concept_app/cubits/app/app_cubit.dart';
import 'package:cake_concept_app/presentation/shared/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../cubits/app/app_state.dart';
import '../data/utils/constants.dart';
import '../presentation/shared/screen_util.dart';
import 'injection/get_it.dart';
import 'provider/app_localization.dart';
import 'provider/localization_provider.dart';
import 'routing/pager.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    List<Locale> locals = [];
    for (var language in Constants.languages) {
      locals.add(Locale(language.languageCode!, language.countryCode));
    }
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: Config.figmaDesignSize,
      child: ThemeProvider(
        initTheme: CakeyThemeData.lightTheme,
        builder: (_, myTheme) {
          return MaterialApp(
            title: 'Cakey',
            themeAnimationDuration: AppDurations.ms500,
            theme: myTheme,
            navigatorKey: locator(),
            debugShowCheckedModeBanner: false,
            locale: Provider.of<LocalizationProvider>(context).locale,
            supportedLocales: locals,
            localizationsDelegates: const [
              AppLocalization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            home: BlocProvider(
              create: (_) => AppCubit(),
              child: BlocBuilder<AppCubit, AppState>(
                builder: (_, state) {
                  return Pager.splash;
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
