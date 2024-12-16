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
      padding: EdgeInsets.only(left: 14, top: 15, right: 14, bottom: 5),
      decoration: BoxDecoration(
        color: Color(0xFFECECEC),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 상담사 사진
          ClipOval(
            child: Image.network(
              imageUrl,
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
                SizedBox(height: 8),
                if (isReviewed) ...[
                  Text(
                    '리뷰: $reviewText',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '나의 만족도: ★$rating',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      _buildReviewButton(),
                    ],
                  ),
                ] else ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '리뷰 미작성',
                        style: TextStyle(color: Colors.red),
                      ),
                      _buildReviewButton(),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewButton() {
    return TextButton(
      onPressed: () {
        // 리뷰 작성 페이지로 이동
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: 8, vertical: 4)),
        minimumSize: MaterialStateProperty.all(Size(60, 30)),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(color: Color(0xFFE7A137), width: 1),
          ),
        ),
        elevation: MaterialStateProperty.all(0), // 그림자 제거
      ),
      child: Text(
        isReviewed ? '보기 >' : '쓰기 >',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Color(0xFFE7A137),
          fontSize: 12,
        ),
      ),
    );
  }
}
