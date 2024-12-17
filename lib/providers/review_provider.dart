import 'package:flutter/material.dart';

class Review {
  final String counselor;
  final String date;
  final String time;
  final String duration;
  final String reviewText;
  final double rating;
  final String imageUrl;
  final bool isReviewed;

  Review({
    required this.counselor,
    required this.date,
    required this.time,
    required this.duration,
    required this.reviewText,
    required this.rating,
    required this.imageUrl,
    required this.isReviewed,
  });
}

class ReviewProvider with ChangeNotifier {
  final List<Review> _reviews = [
    Review(
      counselor: '오호라',
      date: '2024-12-10',
      time: '23:30',
      duration: '30분',
      reviewText: '상담 내용 예시...',
      rating: 5.0,
      imageUrl: 'https://i.pravatar.cc/80?img=45',
      isReviewed: false,
    ),
    // 추가 리뷰 데이터...
  ];

  List<Review> get reviews => _reviews;

  // 리뷰 작성 상태 업데이트
  void markAsReviewed(int index, String newReviewText, double newRating) {
    _reviews[index] = Review(
      counselor: _reviews[index].counselor,
      date: _reviews[index].date,
      time: _reviews[index].time,
      duration: _reviews[index].duration,
      reviewText: newReviewText,
      rating: newRating,
      imageUrl: _reviews[index].imageUrl,
      isReviewed: true,
    );
    notifyListeners();
  }
}
