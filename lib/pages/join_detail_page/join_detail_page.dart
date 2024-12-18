import 'package:flutter/material.dart';
import 'package:renewus/pages/category_main_page/category_main_page.dart';
import 'package:renewus/pages/category_main_page/widgets/common_bottom_sheet.dart';

class JoinDetailPage extends StatelessWidget {
  const JoinDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 80.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '개인정보 수집 및 이용 안내',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF46372A),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '개인정보 수집 및 이용 안내 회원 가입, 고객상담을 위해서는 아래와 같이 개인정보를 수집 및 이용합니다. 개인정보 수집 목적 : 회원가입 의사 확인, 회원제 서비스 제공에 따른 본인 식별, 인증, 회원자격 유지 관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정이용방지, 각종 통지, 고충처리, 본인인증, 연령인증, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등 개인정보 수집 항목 : 이름, 생년월일, 성별, 내외국인 유무, 연계정보, 중복가입확인정보, 로그인ID,이메일, 연락처, 법정대리인 이름   보유 및 이용기간 : 회원타퇴시까지 2년(2년 주기 재동의)*개인정보 수집 및 이용에 동의하지 않을 권리가 있으며, 동의를 거부할 경우에는 회원가입이 불가합니다. 위 개인정보 수집 및 이용에 동의합니다.(필수).',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF46372A),
                ),
              ),
              const SizedBox(height: 20),
              // 이메일/전화번호 입력 필드
              const TextField(
                decoration: InputDecoration(
                  labelText: '이메일/전화번호',
                  labelStyle: TextStyle(color: Color(0xFF46372A)), // 라벨 글자 색상
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF46372A)), // 밑줄 색상
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF46372A)), // 포커스 시 밑줄 색상
                  ),
                ),
                style: TextStyle(color: Color(0xFF46372A)), // 입력 텍스트 색상
              ),
              const SizedBox(height: 20),
              // 비밀번호 입력 필드
              const TextField(
                decoration: InputDecoration(
                  labelText: '비밀번호',
                  labelStyle: TextStyle(color: Color(0xFF46372A)), // 라벨 글자 색상
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF46372A)), // 밑줄 색상
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF46372A)), // 포커스 시 밑줄 색상
                  ),
                ),
                style: TextStyle(color: Color(0xFF46372A)), // 입력 텍스트 색상
                obscureText: true, // 비밀번호 숨김
              ),
              const SizedBox(height: 20),
              // '완료' 버튼
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CommonBottomSheet()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white, // 흰색 테두리
                        width: 2.0, // 테두리 두께
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: const Text(
                        '완료',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          color: Colors.white, // 텍스트 색상은 흰색
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
