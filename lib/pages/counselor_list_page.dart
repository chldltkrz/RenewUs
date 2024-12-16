import 'package:flutter/material.dart';

class CounselorListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('상담사 리스트')),
      body: ListView.builder(
        itemCount: 20, // 상담사 리스트 개수 (샘플 데이터)
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/100'),
            ),
            title: Text('상담사 ${index + 1}'),
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
