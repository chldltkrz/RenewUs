import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/renewus_logo.png',
          width: 92,
        ),
        SizedBox(height: 24),
        Text(
          'RENEWUS',
          style: TextStyle(
            fontFamily: 'Noto Sans KR',
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8),
        Text(
          '부부간의 소통을 이야기하다',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
