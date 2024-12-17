import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'page_provider.dart';
import 'join_detail_page.dart';

// Riverpod 적용된 JoinPage
class JoinPage extends ConsumerWidget {
  const JoinPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/renewus_logo.jpeg', height: 100), // 로고 표시
            const SizedBox(height: 20),
            _buildButton(context, '이메일로 가입하기', () {
              ref.read(pageProvider.notifier).setPage('join_detail');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const JoinDetailPage()),
              );
            }),
            _buildButton(context, '구글로 가입하기', () {}),
            _buildButton(context, '전화번호로 가입하기', () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
      BuildContext context, String text, VoidCallback onPressed) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: 250,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF690AC7), // 버튼 색상
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
