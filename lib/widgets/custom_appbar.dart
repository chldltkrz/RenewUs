import 'package:flutter/material.dart';
import 'package:renewus/themes/app_themes.dart';

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
          color: AppTheme.primaryColor.withOpacity(0.85), // AppTheme 색상 적용
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
          color: Color(0xFFA7A69A), // AppTheme 색상 적용
        ),

        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            Navigator.pushNamed(context, '/myPage');
          },
          color: Color(0xFFA7A69A), // AppTheme 색상 적용
        ),
      ],
      backgroundColor: AppTheme.backgroundColor, // AppTheme 배경색 적용
      elevation: 0, // 그림자 제거
    );
  }
}
