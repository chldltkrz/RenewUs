import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:renewus/not_used/notification_page.dart';
import 'package:renewus/pages/counseling_main_page/counseling_main_page.dart';
import 'package:renewus/pages/counselor_profile_page/counselor_profile_page.dart';
import 'package:renewus/pages/firebase_options.dart';
import 'package:renewus/pages/join_page/join_page.dart';
import 'package:renewus/pages/my_page/my_page.dart'; // MyPage 임포트
import 'package:renewus/pages/my_review_page/my_review_page.dart';
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
      // CounselorProfilePage(
      //   counselorName: '이은총', // 기본 상담사 이름
      //   favoritedCounselors: favoritedCounselors,
      // ),
      routes: {
        '/myPage': (context) =>
            MyPage(favoritedCounselors: favoritedCounselors),
        '/myReviewPage': (context) => MyReviewPage(),
        '/notifications': (context) => NotificationPage(),
        '/counselingMainPage': (context) =>
            CounselingMainPage(), // 상담/예약 내역 페이지 경로 추가
        // 다른 라우트 추가...
      },
    );
  }
}
