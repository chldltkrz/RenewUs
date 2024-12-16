import 'package:flutter/material.dart';
import 'package:renewus/themes/app_themes.dart';

class CounselorProfileBottomSheet extends StatelessWidget {
  final VoidCallback onReservePressed;
  final bool isFavorited;
  final VoidCallback onFavoriteToggle;

  const CounselorProfileBottomSheet({
    required this.onReservePressed,
    required this.isFavorited,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        border: Border(
          top: BorderSide(color: Color(0xFFEFEAE7), width: 1.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          // 찜하기 아이콘
          IconButton(
            icon: Icon(
              isFavorited ? Icons.favorite : Icons.favorite_border,
              color: isFavorited ? Colors.red : Color(0xFFA7A69A),
              size: 28,
            ),
            onPressed: onFavoriteToggle,
          ),
          SizedBox(width: 10),
          // 선택하기 버튼
          Expanded(
            child: ElevatedButton(
              onPressed: onReservePressed,
              child: Text(
                '선택하기',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF4BA3E), // 버튼 배경 색상
                foregroundColor: AppTheme.primaryColor, // 버튼 글자 색상
                padding: EdgeInsets.symmetric(vertical: 12),
                elevation: 0, // 그림자 제거
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
