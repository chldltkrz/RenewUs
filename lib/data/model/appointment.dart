import 'package:renewus/data/model/appointment_review.dart';

class Appointment {
  String username;
  String counselorName;
  DateTime appointmentDate;
  String appointmentTime;
  String duration;
  bool extended;
  DateTime createdAt;
  bool finished;
  String imageUrl;
  bool isReviewed;
  AppointmentReview? review;

  Appointment({
    required this.username,
    required this.counselorName,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.duration,
    required this.extended,
    required this.createdAt,
    required this.finished,
    required this.imageUrl,
    required this.isReviewed,
    this.review,
  });

  Appointment.fromJson(Map<String, dynamic> json)
      : this(
          username: json['username'],
          counselorName: json['counselorName'],
          appointmentDate: DateTime.parse(json['appointmentDate']),
          appointmentTime: json['appointmentTime'],
          duration: json['duration'],
          extended: json['extended'],
          createdAt: DateTime.parse(json['createdAt']),
          finished: json['finished'],
          imageUrl: json['imageUrl'],
          isReviewed: json['isReviewed'],
          review: json['review'] != null
              ? AppointmentReview.fromJson(json['review'])
              : null,
        );

  Map<String, dynamic> toJson() => {
        'username': username,
        'counselorName': counselorName,
        'appointmentDate': appointmentDate.toIso8601String(),
        'appointmentTime': appointmentTime,
        'duration': duration,
        'extended': extended,
        'createdAt': createdAt.toIso8601String(),
        'finished': finished,
        'imageUrl': imageUrl,
        'isReviewed': isReviewed,
        'review': review?.toJson(),
      };
}
