import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainBottomSheet extends StatelessWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onPersonalityTestPressed;
  final VoidCallback onRecommendedCounselorPressed;
  final VoidCallback onConsultationPressed;

  // 아이콘의 활성화 상태를 추적하는 변수
  final bool isHomeActive;
  final bool isPersonalityTestActive;
  final bool isRecommendedCounselorActive;
  final bool isConsultationActive;

  const MainBottomSheet({
    Key? key,
    required this.onHomePressed,
    required this.onPersonalityTestPressed,
    required this.onRecommendedCounselorPressed,
    required this.onConsultationPressed,
    required this.isHomeActive,
    required this.isPersonalityTestActive,
    required this.isRecommendedCounselorActive,
    required this.isConsultationActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: screenHeight * 0.1, // 바텀시트 높이 조정
      decoration: BoxDecoration(
        color: Color(0xFFFCF8F7), // 배경 색상
        border: Border(
          top: BorderSide(
            color: Color(0xFFEFEAE7), // 경계 색상
            width: 1.0, // 얇은 선
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, // 아이콘과 이름을 위쪽으로 붙임
        crossAxisAlignment: CrossAxisAlignment.center, // 중앙 정렬
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildMenuButton(
                icon: CupertinoIcons.home,
                onPressed: onHomePressed,
                isActive: isHomeActive,
                label: '홈',
              ),
              _buildMenuButton(
                icon: Icons.assignment_outlined,
                onPressed: onPersonalityTestPressed,
                isActive: isPersonalityTestActive,
                label: '성격검사',
              ),
              _buildMenuButton(
                icon: CupertinoIcons.group,
                onPressed: onRecommendedCounselorPressed,
                isActive: isRecommendedCounselorActive,
                label: '상담사추천',
              ),
              _buildMenuButton(
                icon: CupertinoIcons.chat_bubble_text,
                onPressed: onConsultationPressed,
                isActive: isConsultationActive,
                label: '상담하기',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton({
    required IconData icon,
    required VoidCallback onPressed,
    required bool isActive, // 아이콘 활성화 상태를 인자로 받음
    required String label, // 아이콘 아래에 표시할 텍스트
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min, // 자식 위젯의 크기를 최소화
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isActive
                ? Colors.transparent
                : Color(0xFFFCF8F7), // 비활성화 상태에서 배경색을 투명하게
            foregroundColor: Colors.white, // 아이콘 기본 색상
            shape: CircleBorder(),
            padding: EdgeInsets.all(8),
            elevation: 0, // 그림자 제거
          ),
          onPressed: onPressed,
          child: Icon(
            icon,
            color: isActive
                ? Color(0xFF252526) // 활성화된 아이콘 색상 (진하게)
                : Color(0xFFA7A69A), // 비활성화된 아이콘 색상
            size: 28, // 아이콘 크기 조정
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: isActive
                ? Color(0xFF252526) // 활성화된 텍스트 색상 (진하게)
                : Color(0xFF999795), // 비활성화된 텍스트 색상
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
