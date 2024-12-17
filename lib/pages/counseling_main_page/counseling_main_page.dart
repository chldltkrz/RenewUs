import 'package:flutter/material.dart';

class CounselingMainPage extends StatelessWidget {
  const CounselingMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('상담하기'),
        backgroundColor: const Color(0xFF690AC7),
      ),
      body: Column(
        children: [
          _reservationCard(), // The reservation card
          const SizedBox(height: 10), // Adjusted spacing
          Expanded(child: _counselorList()), // Ensure the list expands properly
        ],
      ),
    );
  }

  // 예약된 상담 카드
  Widget _reservationCard() {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Added padding for better spacing
        child: ListTile(
          title: const Text('예약 확정된 상담사'),
          subtitle: const Text(
            '날짜: 2024년 12월 11일\n시간: 22:00\n이용시간: 30분',
            style: TextStyle(height: 1.5), // Better line spacing
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
        // Add more counselors as needed
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
