import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'app/injection/get_it.dart';
import 'app/provider/localization_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Injection.register();

  runApp(
    ChangeNotifierProvider<LocalizationProvider>(
      create: (_) => locator(),
      child: const App(),
    ),
  );
}