import 'package:flutter/material.dart';
import 'package:renewus/themes/app_themes.dart'; // AppTheme 임포트
import 'package:renewus/pages/my_page.dart'; // MyPage 임포트
import 'pages/my_review_page.dart'; // 나의 리뷰 화면
import 'pages/counselor_profile_page.dart'; // 상담사 프로필 화면
import 'pages/category_main_page.dart'; // 카테고리 화면
import 'pages/counselor_list_page.dart'; // 상담사 리스트 화면
import 'pages/recommended_counselor_page.dart'; // 추천 상담사 화면

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RenewUs',
      theme: AppTheme.lightTheme, // 테마 적용
      initialRoute: '/', // 앱의 초기 화면
      routes: {
        '/': (context) => MyPage(), // MyPage를 앱의 초기 화면으로 설정
        '/myPage': (context) => MyPage(), // '/myPage'를 MyPage로 연결
        '/myReview': (context) => MyReviewPage(),
        '/counselorProfile': (context) => CounselorProfilePage(),
        '/categoryMain': (context) => CategoryMainPage(),
        '/counselorList': (context) => CounselorListPage(),
        '/recommendedCounselor': (context) => RecommendedCounselorPage(),
      },
    );
  }
}
