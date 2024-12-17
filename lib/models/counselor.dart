class Counselor {
  final String id;
  final String name;
  final double price30Min;
  final double price50Min;
  final String description;
  final double rating; // 별점 (리뷰 점수)

  Counselor({
    required this.id,
    required this.name,
    required this.price30Min,
    required this.price50Min,
    required this.description,
    required this.rating,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Counselor && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
