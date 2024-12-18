import 'package:flutter/material.dart';

class CounselorCard extends StatelessWidget {
  final String counselorName;
  final String date;
  final String time;
  final String duration;
  final String imageUrl;

  CounselorCard({
    required this.counselorName,
    required this.date,
    required this.time,
    required this.duration,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFFFFE0B2).withOpacity(0.8),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 상담사 사진
          ClipOval(
            child: Image.network(
              imageUrl, // 실제 이미지 URL로 변경
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          // 상담사 정보
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '상담사: $counselorName',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    // 예약확정 표시
                    Text(
                      '예약확정',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text('날짜: $date ($time)'),
                Text('이용시간: $duration'),
              ],
            ),
          ),
          // 상담 입장 버튼을 우측 하단에 위치시킴
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                ),
                minimumSize: MaterialStateProperty.all(Size(60, 30)),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(
                        color: Color.fromARGB(255, 215, 139, 39), width: 1),
                  ),
                ),
                elevation: MaterialStateProperty.all(0),
              ),
              onPressed: () {
                // 상담 입장 페이지로 이동
              },
              child: Text('상담 입장',
                  style: TextStyle(color: Color.fromARGB(255, 215, 139, 39))),
            ),
          ),
        ],
      ),
    );
  }
}
