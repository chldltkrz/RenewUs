class AppointmentReview {
  String reviewText;
  double rating;

  AppointmentReview({
    required this.reviewText,
    required this.rating,
  });

  AppointmentReview.fromJson(json)
      : this(
          reviewText: json['reviewText'],
          rating: json['rating'],
        );

  Map<String, dynamic> toJson() => {
        'reviewText': reviewText,
        'rating': rating,
      };
}
