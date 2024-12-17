import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../join_detail_page/join_detail_page.dart';

// Riverpod 적용된 JoinPage
class JoinPage extends ConsumerWidget {
  const JoinPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // 배경에 그라데이션 적용
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFF3E0), // 밝은 크림색
              Color(0xFFFFE0B2), // 따뜻한 오렌지빛 베이지
              Color(0xFFFFAB91), // 부드러운 코랄
              Color(0xFFD84315), // 짙은 테라코타
            ],
            stops: [0.1, 0.4, 0.7, 1.0],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 로고가 들어가는 원형 박스
              Container(
                width: 120, // 원형 크기
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.8), // 테두리 색상
                    width: 3.0,
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFFE0B2), // 따뜻한 오렌지빛 베이지
                      Color(0xFFFFAB91), // 부드러운 코랄
                    ],
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/renewus_logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              _buildOutlineButton(context, '이메일로 가입하기', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const JoinDetailPage()),
                );
              }),
              _buildOutlineButton(context, '구글로 가입하기', () {}),
              _buildOutlineButton(context, '전화번호로 가입하기', () {}),
            ],
          ),
        ),
      ),
    );
  }

  // 투명한 배경과 흰색 아웃라인 버튼
  Widget _buildOutlineButton(
      BuildContext context, String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
