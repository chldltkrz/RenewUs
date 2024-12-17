class CounselorProfile {
  String id;
  String counselorEmail;
  String counselorName;
  String password;
  double rating;
  String introduction;
  List<String> profiles;
  List<String> reviews;
  DateTime createdAt;

  CounselorProfile({
    required this.id,
    required this.counselorEmail,
    required this.counselorName,
    required this.password,
    required this.rating,
    required this.introduction,
    required this.profiles,
    required this.reviews,
    required this.createdAt,
  });

  CounselorProfile.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          counselorEmail: json['counselorEmail'],
          counselorName: json['counselorName'],
          password: json['password'],
          rating: json['rating'],
          introduction: json['introduction'],
          profiles: json['profiles'],
          reviews: json['reviews'],
          createdAt: DateTime.parse(json['createdAt']),
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'counselorEmail': counselorEmail,
        'counselorName': counselorName,
        'password': password,
        'rating': rating,
        'introduction': introduction,
        'profiles': profiles,
        'reviews': reviews,
        'createdAt': createdAt.toIso8601String(),
      };
}
