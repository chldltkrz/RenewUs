import 'package:flutter/material.dart';

class RecommendedCounselorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('추천 상담사')),
      body: ListView.builder(
        itemCount: 5, // 추천 상담사 개수 (샘플 데이터)
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/100'),
            ),
            title: Text('추천 상담사 ${index + 1}'),
            subtitle: Text('상담 분야: 부부 상담'),
            onTap: () {
              Navigator.pushNamed(context, '/counselorProfile');
            },
          );
        },
      ),
    );
  }
}
