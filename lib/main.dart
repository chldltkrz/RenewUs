import 'package:flutter/material.dart';
import 'package:renewus/themes/app_themes.dart'; // AppTheme 임포트
import 'package:renewus/pages/my_page.dart'; // MyPage 임포트
import 'package:renewus/pages/my_review_page.dart'; // 나의 리뷰 화면
import 'package:renewus/pages/counselor_profile_page.dart'; // 상담사 프로필 화면
import 'package:renewus/pages/category_main_page.dart'; // 카테고리 화면
import 'package:renewus/pages/counselor_list_page.dart'; // 상담사 리스트 화면
import 'package:renewus/pages/recommended_counselor_page.dart'; // 추천 상담사 화면
import 'package:renewus/pages/counselor_reservation_page.dart';
import 'package:renewus/pages/counselor_review.dart';
import 'package:renewus/pages/favorited_counselors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> favoritedCounselors = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RenewUs',
      theme: AppTheme.lightTheme, // 테마 적용
      initialRoute: '/', // 앱의 초기 화면
      routes: {
        '/': (context) => MyPage(
            favoritedCounselors: favoritedCounselors), // MyPage를 앱의 초기 화면으로 설정
        '/myPage': (context) =>
            MyPage(favoritedCounselors: favoritedCounselors),
        '/myReview': (context) => MyReviewPage(),
        '/counselorProfile': (context) {
          final args = ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>?;
          final counselorName = args != null ? args['name'] : '알 수 없음';
          return CounselorProfilePage(
              counselorName: counselorName,
              favoritedCounselors: favoritedCounselors);
        },
        '/counselorReview': (context) => CounselorReview(),
        '/counselorReservation': (context) => CounselorReservationPage(),
        '/categoryMain': (context) => CategoryMainPage(),
        '/counselorList': (context) => CounselorListPage(),
        '/recommendedCounselor': (context) => RecommendedCounselorPage(),
        '/favoritedCounselors': (context) => FavoritedCounselors(),
      },
    );
  }
}
