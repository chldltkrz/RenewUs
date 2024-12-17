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
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFFE7A0), // 세련된 크림 노랑
            Color(0xFFF2C94C), // 부드러운 머스터드 톤
            Color(0xFFE7A137), // 기존 금색
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/80'),
                  radius: 40,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: theme.textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        userId,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.textTheme.bodyMedium?.color,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '충전 잔액: $balance',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/editProfile');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFE7A0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '내 정보',
                          style: TextStyle(
                            color: Color(0xFF6C4B12),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // SizedBox(width: 8),
                        // Icon(
                        //   Icons.arrow_forward_ios,
                        //   color: Color(0xFFE7A137),
                        //   size: 18,
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/charge');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFE7A0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '충전하기',
                          style: TextStyle(
                            color: Color(0xFF6C4B12),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // SizedBox(width: 8),
                        // Icon(
                        //   Icons.arrow_forward_ios,
                        //   color: Color(0xFFE7A137),
                        //   size: 18,
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
