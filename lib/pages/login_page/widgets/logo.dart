import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/renewus_logo.png',
          width: 150,
        ),
        SizedBox(height: 32),
        Text(
          'RENEWUS',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '부부간의 소통을 이야기하다',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w200,
          ),
        ),
      ],
    );
  }
}
