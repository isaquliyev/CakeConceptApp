import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class CakeyThemeData {
  static ThemeData lightTheme = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
    brightness: Brightness.light
  );

  static ThemeData darkTheme = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
      brightness: Brightness.dark
  );
}

extension CakeyThemeDataExt on ThemeData {
  Color get example {
    if (brightness == Brightness.light) {
      return UIColor.white;
    } else {
      return UIColor.black;
    }
  }
}