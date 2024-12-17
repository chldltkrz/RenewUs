import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:renewus/pages/firebase_options.dart';
import 'package:renewus/pages/join_page/join_page.dart';
import 'package:renewus/themes/app_themes.dart'; // AppTheme 임포트

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  final List<String> favoritedCounselors = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RenewUs',
      theme: AppTheme.lightTheme, // 테마 적용
      home: JoinPage(),
    );
  }
}
