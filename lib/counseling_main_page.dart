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
          _reservationCard(),
          const SizedBox(height: 20),
          _counselorList(),
        ],
      ),
    );
  }

  // 예약된 상담 카드
  Widget _reservationCard() {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      child: ListTile(
        title: const Text('예약 확정된 상담사'),
        subtitle: const Text('날짜: 2024년 12월 11일\n시간: 22:00\n이용시간: 30분'),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF690AC7)),
          onPressed: () {},
          child: const Text('입장', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  Widget _counselorList() {
    return Expanded(
      child: ListView(
        children: [
          _counselorCard('김현호', '전문가 상담사'),
          _counselorCard('가나다', '실시간 상담 가능'),
        ],
      ),
    );
  }

  Widget _counselorCard(String name, String description) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(name),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFF690AC7)),
      ),
    );
  }
}
