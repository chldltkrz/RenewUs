import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String counselorName;
  final String date;
  final String time;
  final int duration;
  final String reviewText;

  ReviewCard({
    required this.counselorName,
    required this.date,
    required this.time,
    required this.duration,
    required this.reviewText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          // 상담사 사진
          ClipOval(
            child: Image.network(
              'https://via.placeholder.com/50', // 임시 이미지 URL
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          // 리뷰 정보
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('상담사: $counselorName'),
              Text('날짜: $date ($time)'),
              Text('이용시간: $duration 분'),
              SizedBox(height: 8),
              Text('리뷰 내용: $reviewText'),
            ],
          ),
          Spacer(),
          // 리뷰 쓰기 버튼
          TextButton(
            onPressed: () {
              // 리뷰 작성 페이지로 이동할 때 구현
            },
            child: Text('리뷰 쓰기 >'),
          ),
        ],
      ),
    );
  }
}
