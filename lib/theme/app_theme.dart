import 'package:flutter/material.dart';

ThemeData initThemeData({required Brightness brightness}) {
  if (brightness == Brightness.light) {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: Color(0xFF6385FF), // 주요 색상
        secondary: Color(0xFF2ACDD6), // 보조 색상
        onPrimary: Colors.white, // 주 색상의 대비 색상
      ),
      primaryColor: Color(0xFF6385FF),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.grey,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
        titleLarge: TextStyle(color: Colors.black),
      ),
    );
  } else {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: Colors.blueAccent, // 주요 색상
        secondary: Colors.greenAccent, // 보조 색상
        onPrimary: Colors.black, // 대비 색상 설정
      ),
      primaryColor: Colors.blueAccent,
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.blueAccent),
        bodyMedium: TextStyle(color: Colors.blueAccent),
        titleLarge: TextStyle(color: Colors.blueAccent),
      ),
    );
  }
}
