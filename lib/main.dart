import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'join_page.dart';

void main() {
  runApp(
    const ProviderScope( // Riverpod을 위한 ProviderScope 설정
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RenewUS',
      theme: ThemeData(
        primaryColor: const Color(0xFF690AC7),
      ),
      home: const JoinPage(), // 시작 페이지
    );
  }
}
