import 'package:flutter/material.dart';

class VoxTheme {
  static ThemeData lightTheme = ThemeData(
      colorScheme: const ColorScheme.dark(
        secondary: Color(0xff7551FF),
        primary: Color(0xff111C44),
        background: Color(0xff0B1437),
        onSecondary: Color(0xffA3AED0),
        onPrimary: Color(0xffA3AED0),
        surface: Color(0xff9AA5C7),
      ),
      fontFamily: 'DM Sans',
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Color(0xffFFFFFF),
        ),
        displaySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xffFFFFFF),
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Color(0xffFFFFFF),
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Color(0xffFFFFFF),
        ),
      ));
}
