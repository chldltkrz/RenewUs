import 'package:flutter/material.dart';
import 'package:renewus/themes/app_themes.dart'; // AppTheme
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'join_page.dart';

void main() {
  runApp(
    const ProviderScope( // Riverpod을 위한 ProviderScope 설정
      child: MyApp(),
    ),
  );

class MyApp extends StatelessWidget {
  final List<String> favoritedCounselors = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'RenewUS',
      theme: AppTheme.lightTheme, // 테마 적용
      home: const JoinPage(), // 시작 페이지

    );
  }
}
