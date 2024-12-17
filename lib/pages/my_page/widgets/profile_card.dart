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
            Color(0xFFFFE0B2), // 따뜻한 오렌지빛 베이지
            Color(0xFFFFAB91), // 부드러운 코랄
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
                      NetworkImage('https://i.pravatar.cc/80?img=24'),
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
                          color: Color.fromARGB(255, 82, 58, 17),
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
                      backgroundColor: Colors.transparent, // 배경색 투명
                      side: BorderSide(
                        color: Color(0xFF6C4B12).withOpacity(0.8), // 테두리 색상
                        width: 2, // 테두리 두께
                      ),
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
                      backgroundColor: Colors.transparent, // 배경색 투명
                      side: BorderSide(
                        color: Color(0xFF6C4B12).withOpacity(0.8), // 테두리 색상
                        width: 2, // 테두리 두께
                      ),
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
