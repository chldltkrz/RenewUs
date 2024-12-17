class Counselor {
  String id;
  String counselorEmail;
  String counselorName;
  String password;
  double rating;
  String introduction;
  List<String> profiles;
  List<String> reviews;
  String imageUrl;
  DateTime createdAt;

  var price30Min;

  var price50Min;

  Counselor({
    required this.id,
    required this.counselorEmail,
    required this.counselorName,
    required this.password,
    required this.rating,
    required this.introduction,
    required this.profiles,
    required this.reviews,
    required this.imageUrl,
    required this.createdAt,
  });

  Counselor.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          counselorEmail: json['counselorEmail'],
          counselorName: json['counselorName'],
          password: json['password'],
          rating: json['rating'],
          introduction: json['introduction'],
          profiles: json['profiles'],
          reviews: json['reviews'],
          imageUrl: json['imageUrl'],
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
