import 'package:flutter/material.dart';
import 'package:renewus/widgets/custom_appbar.dart';
import 'package:renewus/widgets/custom_list_tile.dart';
import 'package:renewus/widgets/main_bottom_sheet.dart';

class MyPage extends StatefulWidget {
  final List<String> favoritedCounselors;

  // favoritedCounselors를 네임드 파라미터로 받음
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
              _buildProfileCard(context),
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
                  Navigator.pushNamed(context, '/counselingHistory');
                },
              ),
              CustomListTile(
                title: '나의 리뷰',
                icon: Icons.rate_review,
                onTap: () {
                  Navigator.pushNamed(context, '/myReview');
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

  Widget _buildProfileCard(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF7B942),
            Color(0xFFE7A137),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/80'),
                  radius: 40,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '이노브',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF382E18),
                        ),
                      ),
                      Text(
                        '@innowave',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF6C4B12),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '충전 잔액: 20,000원',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFE9E8E4),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/editProfile');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6C4B12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '내 정보',
                            style: TextStyle(
                              color: Color(0xFFE7A137),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFFE7A137),
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/charge');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6C4B12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '충전하기',
                            style: TextStyle(
                              color: Color(0xFFE7A137),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFFE7A137),
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
