import 'package:flutter/material.dart';
import 'package:renewus/widgets/custom_appbar.dart';
import 'package:renewus/widgets/main_bottom_sheet.dart';

class CounselingMainPage extends StatelessWidget {
  const CounselingMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '상담 예약 목록'), // 기존의 CustomAppBar 사용
      body: Column(
        children: [
          _reservationCard(), // 예약된 상담 카드
          const SizedBox(height: 10), // 카드 사이 여백
          Expanded(child: _counselorList()), // 상담사 목록
        ],
      ),
      bottomSheet: MainBottomSheet(
        onHomePressed: () {},
        onPersonalityTestPressed: () {},
        onRecommendedCounselorPressed: () {},
        onConsultationPressed: () {},
        isHomeActive: true,
        isPersonalityTestActive: true,
        isRecommendedCounselorActive: true,
        isConsultationActive: true,
      ), // 바텀시트 추가
    );
  }

  // 예약된 상담 카드
  Widget _reservationCard() {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0), // 카드 안의 여백
        child: ListTile(
          title: const Text('예약 확정된 상담사'),
          subtitle: const Text(
            '날짜: 2024년 12월 11일\n시간: 22:00\n이용시간: 30분',
            style: TextStyle(height: 1.5), // 줄 간격 조정
          ),
          trailing: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF690AC7),
            ),
            onPressed: () {},
            child: const Text('입장', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }

  // 상담사 목록
  Widget _counselorList() {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        _counselorCard('김현호', '전문가 상담사'),
        _counselorCard('가나다', '실시간 상담 가능'),
        // 추가 상담사 카드 추가 가능
      ],
    );
  }

  // 상담사 카드 위젯
  Widget _counselorCard(String name, String description) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      child: ListTile(
        title: Text(name),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFF690AC7)),
      ),
    );
  }
}
