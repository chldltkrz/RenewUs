import 'package:flutter/material.dart';
import 'package:renewus/pages/category_main_page/category_main_page.dart';

class JoinDetailPage extends StatelessWidget {
  const JoinDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
        backgroundColor: const Color(0xFF690AC7),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '개인정보 수집 및 이용 안내',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
                '개인정보 수집 및 이용 안내 회원 가입, 고객상담을 위해서는 아래와 같이 개인정보를 수집 및 이용합니다.개인정보 수집 목적 : 회원가입 의사 확인, 회원제 서비스 제공에 따른 본인 식별, 인증, 회원자격 유지 관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정이용방지, 각종 통지, 고충처리, 본인인증, 연령인증, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등 개인정보 수집 항목 : 이름, 생년월일, 성별, 내외국인 유무, 연계정보, 중복가입확인정보, 로그인ID,이메일, 연락처, 법정대리인 이름   보유 및 이용기간 : 회원타퇴시까지 2년(2년 주기 재동의)*개인정보 수집 및 이용에 동의하지 않을 권리가 있으며, 동의를 거부할 경우에는 회원가입이 불가합니다. 위 개인정보 수집 및 이용에 동의합니다.(필수).'),
            const SizedBox(height: 20),
            const TextField(decoration: InputDecoration(labelText: '이메일/전화번호')),
            const TextField(decoration: InputDecoration(labelText: '비밀번호')),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF690AC7),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CategoryMainPage()),
                  );
                },
                child: const Text('완료', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
