import 'package:flutter/material.dart';

class AppTheme {
  // 기본 색상 설정
  static const Color primaryColor = Color(0xFF46372A); // 기본 텍스트 색상
  static const Color backgroundColor = Color(0xFFFCF8F7); // 바탕색
  static const Color textColor = Color(0xFF46372A); // 텍스트 색상

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light, // 밝은 테마
    primaryColor: primaryColor, // 기본 색상
    scaffoldBackgroundColor: backgroundColor, // 배경 색상
    colorScheme: ColorScheme.light(
      primary: primaryColor, // 기본 색상
      secondary: Color(0xFFF4BA3E), // 강조 색상
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFFFCF8F7), // AppBar 배경색
      elevation: 0, // AppBar의 그림자 없애기
      titleTextStyle: TextStyle(
        color: primaryColor.withOpacity(0.85), // 제목 텍스트 색상
        fontWeight: FontWeight.w500,
        fontSize: 18,
        fontFamily: 'Poppins',
      ),
      iconTheme: IconThemeData(
        color: Color(0xFFA7A69A), // 아이콘 색상 (기본값)
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: textColor,
        fontSize: 28.0, // 제목 크기
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: textColor,
        fontSize: 24.0, // 작은 제목 크기
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: textColor,
        fontSize: 16.0, // 본문 텍스트 크기
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        color: textColor,
        fontSize: 14.0, // 더 작은 본문 텍스트 크기
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFF4BA3E), // 버튼 배경 색상
        foregroundColor: Colors.white, // 버튼 글자 색상
        // foregroundColor: Color(0xFF473933), // 버튼 글자 색상
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // 둥근 버튼 모서리
        ),
        padding: EdgeInsets.symmetric(vertical: 12),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Color(0xFF6C4B12), // 텍스트 버튼 색상
        padding: EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // 둥근 버튼 모서리
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Color(0xFF6C4B12),
        side: BorderSide(color: Color(0xFF6C4B12), width: 2), // 아웃라인 색상
        padding: EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // 둥근 버튼 모서리
        ),
      ),
    ),
  );
}
