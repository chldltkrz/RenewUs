import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(56.0); // 기본 AppBar 크기

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black.withOpacity(0.85),
        ),
      ),
      centerTitle: true, // title을 가운데로 위치시킴
      actions: [
        // 알림 아이콘
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
            // 알림 클릭시 처리할 내용
            print("알림 클릭됨");
          },
        ),
        // 마이페이지 아이콘
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            // 마이페이지로 이동
            Navigator.pushNamed(context, '/myPage');
          },
        ),
      ],
      backgroundColor: Color(0xFFFCF8F7), // AppBar 배경색
      elevation: 0, // 그림자 제거
    );
  }
}
