import 'package:flutter/material.dart';

class AppTheme {
  static const Color lightPrimaryColor = Color(0xff1373C3);
  static const Color lightAccentColor = Color(0xFF1278CD);
  static const Color scaffoldBackground = Color(0xFFFFFFFF);

  static const Color appTextColor = Color(0xFF200E32);
  static const Color disabledTextColor = Color(0xFF7E8B96);
  static const Color disabledButtonColor = Color(0xFFC2C2C2);
  static const Color redColor = Color(0xFFF0604C);

  const AppTheme._();

  static final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      centerTitle: false,
    ),
    primaryColor: lightPrimaryColor,
    fontFamily: 'Cairo',
    scaffoldBackgroundColor: scaffoldBackground,
    platform: TargetPlatform.iOS,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: lightAccentColor,
      primary: lightPrimaryColor,
    ),
  );
}
