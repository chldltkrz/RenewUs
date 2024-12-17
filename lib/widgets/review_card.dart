import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String counselorName;
  final String date;
  final String time;
  final String duration;
  final String reviewText;
  final bool isReviewed;
  final double rating;
  final String imageUrl;

  ReviewCard({
    required this.counselorName,
    required this.date,
    required this.time,
    required this.duration,
    required this.reviewText,
    required this.isReviewed,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFFECECEC),
        borderRadius: BorderRadius.circular(12.0),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.1),
        //     spreadRadius: 1,
        //     blurRadius: 6,
        //     offset: Offset(0, 2),
        //   ),
        // ],
      ),
      child: Row(
        children: [
          // 상담사 사진
          ClipOval(
            child: Image.network(
              imageUrl, // 이미지 URL 받아오기
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('상담사: $counselorName'),
                Text('날짜: $date ($time)'),
                Text('이용시간: $duration'),
                if (isReviewed) ...[
                  SizedBox(height: 8),
                  Text('리뷰: $reviewText',
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                  SizedBox(height: 8),
                  Text('상담 만족도: ★$rating'),
                ] else ...[
                  SizedBox(height: 8),
                  Text('리뷰 미작성', style: TextStyle(color: Colors.red)),
                ],
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                // 리뷰 작성 페이지로 이동할 때 구현
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 12, vertical: 6)),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(color: Color(0xFFF4BA3E), width: 1),
                )),
                elevation: MaterialStateProperty.all(0), // 그림자 없애기
              ),
              child: Text(
                isReviewed ? '보기 >' : '쓰기 >',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFF4BA3E),
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
