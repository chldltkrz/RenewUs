class Counselor {
  String? id;
  String? counselorEmail;
  String? counselorName;
  double? rating;
  int? totalCareer;
  String? introduction;
  String? personalOpinion;
  List<String>? profiles;
  List<String>? reviews;
  String? imageUrl;
  DateTime? createdAt;
  int? price30Min;
  int? price50Min;

  Counselor({
    required this.id,
    required this.counselorEmail,
    required this.counselorName,
    required this.rating,
    required this.totalCareer,
    required this.introduction,
    required this.personalOpinion,
    required this.profiles,
    required this.reviews,
    required this.imageUrl,
    required this.createdAt,
    required this.price30Min,
    required this.price50Min,
  });

  Counselor.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          counselorEmail: json['counselorEmail'],
          counselorName: json['counselorName'],
          rating: (json['rating'] as num?)?.toDouble(),
          totalCareer: (json['totalCareer'] as num?)?.toInt(),
          introduction: json['introduction'],
          personalOpinion: json['personalOpinion'],
          profiles: json['profiles'] is List
              ? (json['profiles'] as List<dynamic>)
                  .map((item) => item.toString())
                  .toList()
              : [], // Default to empty list if it's not a List
          reviews: json['reviews'] is List
              ? (json['reviews'] as List<dynamic>)
                  .map((item) => item.toString())
                  .toList()
              : [], // Default to empty list if it's not a List
          imageUrl: json['imageUrl'],
          createdAt: json['createdAt'] != null
              ? DateTime.parse(json['createdAt'])
              : null,
          price30Min: (json['price30Min'] as num?)?.toInt(),
          price50Min: (json['price50Min'] as num?)?.toInt(),
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'counselorEmail': counselorEmail,
        'counselorName': counselorName,
        'rating': rating,
        'totalCareer': totalCareer,
        'introduction': introduction,
        'personalOpinion': personalOpinion,
        'profiles': profiles,
        'reviews': reviews,
        'createdAt': createdAt?.toIso8601String(),
        'imageUrl': imageUrl,
        'price30Min': price30Min,
        'price50Min': price50Min,
      };
}
