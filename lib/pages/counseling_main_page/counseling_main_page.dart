import 'package:flutter/material.dart';
import 'package:renewus/widgets/custom_appbar.dart';
import 'package:renewus/widgets/main_bottom_sheet.dart';
import 'widgets/counselor_card.dart'; // counselor_card.dart 임포트

class CounselingMainPage extends StatelessWidget {
  const CounselingMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '상담 예약 목록'), // 기존의 CustomAppBar 사용
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 25.0, vertical: 25.0), // 화면 가로 세로 25 여백
        child: Column(
          children: [
            _reservationCard(), // 예약된 상담 카드
            const SizedBox(height: 10), // 카드 사이 여백
            Expanded(child: _recommendationCard()), // 추천 상담사 목록을 화면 하단에 위치
            const SizedBox(height: 30), // 바닥에 여백 추가
          ],
        ),
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
    return Column(
      children: [
        CounselorCard(
          counselorName: '김현호',
          date: '2024년 12월 11일',
          time: '22:00',
          duration: '30분',
          imageUrl: 'https://i.pravatar.cc/80?img=3', // 실제 이미지 URL로 변경
        ),
        CounselorCard(
          counselorName: '가나다',
          date: '2024년 12월 12일',
          time: '14:00',
          duration: '45분',
          imageUrl: 'https://i.pravatar.cc/80?img=1', // 실제 이미지 URL로 변경
        ),
        CounselorCard(
          counselorName: '박지민',
          date: '2024년 12월 15일',
          time: '10:00',
          duration: '60분',
          imageUrl: 'https://i.pravatar.cc/80?img=2', // 실제 이미지 URL로 변경
        ),
      ],
    );
  }

  // 추천 상담사 목록 (가로 스크롤)
  Widget _recommendationCard() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _recommendedCounselorCard('일이삼', '전문가 상담사', 4.5, '경험 풍부한 전문가 상담사',
              'https://i.pravatar.cc/80?img=40'),
          _recommendedCounselorCard('오육칠', '실시간 상담 가능', 4.7, '빠르고 정확한 상담',
              'https://i.pravatar.cc/80?img=41'),
          _recommendedCounselorCard('박지민', '경험이 풍부한 상담사', 4.9, '친절하고 꼼꼼한 상담',
              'https://i.pravatar.cc/80?img=43'),
          _recommendedCounselorCard('최영민', '주간 실시간 상담 가능', 4.6,
              '빠른 응답과 정확한 피드백', 'https://i.pravatar.cc/80?img=4'),
          _recommendedCounselorCard('유재석', '상담 전문', 4.8, '상담과 조언 전문가',
              'https://i.pravatar.cc/80?img=44'),
        ],
      ),
    );
  }

  // 추천 상담사 카드
  Widget _recommendedCounselorCard(String name, String description,
      double rating, String promo, String imageUrl) {
    return Container(
      width: 120,
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 3,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.network(
              imageUrl, // 실제 이미지 URL로 변경
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(description),
          SizedBox(height: 8),
          Text('★ $rating'),
          SizedBox(height: 8),
          Text(promo, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
