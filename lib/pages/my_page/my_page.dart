import 'package:flutter/material.dart';
import 'package:renewus/widgets/custom_appbar.dart';
import 'package:renewus/widgets/custom_list_tile.dart';
import 'package:renewus/pages/my_page/widgets/profile_card.dart';
import 'package:renewus/widgets/main_bottom_sheet.dart';

class MyPage extends StatefulWidget {
  final List<String> favoritedCounselors;

  MyPage({Key? key, required this.favoritedCounselors}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool isHomeActive = false;
  bool isPersonalityTestActive = false;
  bool isRecommendedCounselorActive = false;
  bool isConsultationActive = false;

  void _onConsultationPressed() {
    setState(() {
      isHomeActive = false;
      isPersonalityTestActive = false;
      isRecommendedCounselorActive = false;
      isConsultationActive = true;
    });
    Navigator.pushNamed(context, '/consultationPage');
  }

  void _onHomePressed() {
    setState(() {
      isHomeActive = true;
      isPersonalityTestActive = false;
      isRecommendedCounselorActive = false;
      isConsultationActive = false;
    });
    Navigator.pushNamedAndRemoveUntil(
        context, '/categoryMain', (route) => false);
  }

  void _onPersonalityTestPressed() {
    setState(() {
      isHomeActive = false;
      isPersonalityTestActive = true;
      isRecommendedCounselorActive = false;
      isConsultationActive = false;
    });
    Navigator.pushNamed(context, '/personalityTest');
  }

  void _onRecommendedCounselorPressed() {
    setState(() {
      isHomeActive = false;
      isPersonalityTestActive = false;
      isRecommendedCounselorActive = true;
      isConsultationActive = false;
    });
    Navigator.pushNamed(context, '/recommendedCounselor');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '마이 페이지'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileCard(
                username: '이노브',
                userId: '@innowave',
                balance: '20,000원',
              ),
              SizedBox(height: 26),
              CustomListTile(
                title: '찜한 상담사',
                icon: Icons.favorite,
                onTap: () {
                  Navigator.pushNamed(context, '/favoriteCounselor');
                },
              ),
              CustomListTile(
                title: '상담/예약 내역',
                icon: Icons.calendar_today,
                onTap: () {
                  Navigator.pushNamed(
                      context, '/counselingMainPage'); // 상담/예약 내역 페이지로 이동
                },
              ),
              CustomListTile(
                title: '나의 리뷰',
                icon: Icons.rate_review,
                onTap: () {
                  Navigator.pushNamed(context, '/myReview'); // 수정된 경로로 이동
                },
              ),
              CustomListTile(
                title: '결제 내역',
                icon: Icons.payment,
                onTap: () {
                  Navigator.pushNamed(context, '/paymentHistory');
                },
              ),
              CustomListTile(
                title: '성격 검사',
                icon: Icons.assignment_outlined,
                onTap: () {
                  Navigator.pushNamed(context, '/personalityTest');
                },
              ),
              CustomListTile(
                title: '고객 센터',
                icon: Icons.support_agent,
                onTap: () {
                  Navigator.pushNamed(context, '/customerSupport');
                },
              ),
              CustomListTile(
                title: '이용 안내',
                icon: Icons.info_outline,
                onTap: () {
                  Navigator.pushNamed(context, '/termsOfService');
                },
              ),
              CustomListTile(
                title: '공지 사항',
                icon: Icons.notifications,
                onTap: () {
                  Navigator.pushNamed(context, '/notifications');
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MainBottomSheet(
        onHomePressed: _onHomePressed,
        onPersonalityTestPressed: _onPersonalityTestPressed,
        onRecommendedCounselorPressed: _onRecommendedCounselorPressed,
        onConsultationPressed: _onConsultationPressed,
        isHomeActive: isHomeActive,
        isPersonalityTestActive: isPersonalityTestActive,
        isRecommendedCounselorActive: isRecommendedCounselorActive,
        isConsultationActive: isConsultationActive,
      ),
    );
  }
}
