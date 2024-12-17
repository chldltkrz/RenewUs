import 'package:flutter/material.dart';
import 'package:renewus/widgets/custom_appbar.dart';
import 'package:renewus/widgets/main_bottom_sheet.dart'; // MainBottomSheet 임포트

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '새 메세지'),
      body: Center(
        child: Text("알림과 메세지 목록이 비어있습니다."),
      ),
      bottomSheet: MainBottomSheet(
        onHomePressed: () {
          // 홈 버튼 눌렀을 때의 동작
        },
        onPersonalityTestPressed: () {
          // 성격검사 버튼 눌렀을 때의 동작
        },
        onRecommendedCounselorPressed: () {
          // 상담사추천 버튼 눌렀을 때의 동작
        },
        onConsultationPressed: () {
          // 상담하기 버튼 눌렀을 때의 동작
        },
        isHomeActive: true, // 예시: 홈 버튼 활성화 상태
        isPersonalityTestActive: false, // 성격검사 비활성화
        isRecommendedCounselorActive: false, // 상담사추천 비활성화
        isConsultationActive: false, // 상담하기 비활성화
      ),
    );
  }
}
