import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String username;
  final String userId;
  final String balance;

  const ProfileCard({
    Key? key,
    required this.username,
    required this.userId,
    required this.balance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 현재 테마 가져오기
    final theme = Theme.of(context);

    return Center(
      // 중앙에 배치
      child: Container(
        width: 350,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft, // 그라데이션 시작점
            end: Alignment.bottomRight, // 그라데이션 끝점
            colors: [
              theme.primaryColor, // 테마의 기본 색상 사용
              theme.colorScheme.secondary, // 테마의 보조 색상 사용
            ],
          ),
          border: Border.all(
            color: theme.primaryColor, // 테두리 색상 (기본 색상 사용)
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Card(
          color: Colors.transparent, // 카드 배경을 투명하게
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '사용자: $username',
                  style: TextStyle(
                    color: theme.textTheme.bodyLarge?.color, // 텍스트 색상
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'ID: $userId',
                  style: TextStyle(
                    color: theme.textTheme.bodyMedium?.color, // 텍스트 색상
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '잔액: $balance',
                  style: TextStyle(
                    color: theme.textTheme.bodyMedium?.color
                        ?.withOpacity(0.7), // 텍스트 색상
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
