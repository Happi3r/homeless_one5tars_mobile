import 'dart:ui';

import 'package:flutter/material.dart';

import 'color.dart';

class HomelessTextTheme {
  static TextStyle xxl = const TextStyle(fontFamily: "ExtraBold", fontSize: 36);
  static TextStyle xl = const TextStyle(fontFamily: "Bold", fontSize: 24);
  static TextStyle lg = const TextStyle(fontFamily: "SemiBold", fontSize: 21);
  static TextStyle md = const TextStyle(fontFamily: "Medium", fontSize: 18);
  static TextStyle sm = const TextStyle(fontFamily: "Regular", fontSize: 16);
  static TextStyle xs = const TextStyle(fontFamily: "Light", fontSize: 14);
  static TextStyle xxs = const TextStyle(fontFamily: "Thin", fontSize: 10);

  static TextTheme theme = TextTheme(
      titleLarge: xxl,
      titleMedium: xl,
      bodyLarge: lg,
      bodyMedium: md,
      displayMedium: sm,
      labelMedium: xs,
      labelSmall: xxs);

  static ThemeData lightTheme = ThemeData(
      textTheme: HomelessTextTheme.theme,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xffCADBB7),
        brightness: Brightness.light,
        onPrimary: HomelessColor.text,
        primary: HomelessColor.background,
        onError: HomelessColor.onError,
        error: HomelessColor.error,
        outline: HomelessColor.line,
        tertiary: HomelessColor.success,
        onTertiary: HomelessColor.onSuccess,
        secondary: HomelessColor.secondary
      ),
  );

  static ThemeData darkTheme = ThemeData(
    textTheme: HomelessTextTheme.theme,
    colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xffCADBB7),
        brightness: Brightness.dark,
        onPrimary: HomelessColor.darkText,
        primary: HomelessColor.darkBackground,
        onError: HomelessColor.onError,
        error: HomelessColor.error,
        outline: HomelessColor.line,
        tertiary: HomelessColor.success,
        onTertiary: HomelessColor.onSuccess,
        secondary: HomelessColor.darkSecondary
    ),
  );
}
