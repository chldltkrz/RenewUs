import 'package:flutter/material.dart';
import 'package:renewus/themes/app_themes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasNewNotification; // 새 알림 여부

  const CustomAppBar({
    Key? key,
    required this.title,
    this.hasNewNotification = false, // 기본값: 새 알림 없음
  }) : super(key: key);

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
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.pushNamed(context, '/notifications'); // 알림 페이지로 이동
              },
              color: Color(0xFFA7A69A),
            ),
            if (hasNewNotification)
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Center(
                    child: Text(
                      'N', // 새 알림 텍스트
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),

        // 프로필 아이콘
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            Navigator.pushNamed(context, '/myPage');
          },
          color: Color(0xFFA7A69A),
        ),
      ],
      backgroundColor: AppTheme.backgroundColor, // AppTheme 배경색 적용
      elevation: 0, // 그림자 제거
    );
  }
}
