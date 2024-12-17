import 'package:flutter/material.dart';

class Counselor {
  final String id; // 고유 ID
  final String name; // 상담사 이름
  final double price30Min; // 30분 상담 가격
  final double price50Min; // 50분 상담 가격
  final String description; // 상담사 설명
  final double rating; // 상담사 리뷰 별점

  Counselor({
    required this.id,
    required this.name,
    required this.price30Min,
    required this.price50Min,
    required this.description,
    required this.rating,
  });

  // Counselor 객체 비교를 위해 == 연산자와 hashCode 재정의
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Counselor && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

class FavoriteCounselorProvider with ChangeNotifier {
  final List<Counselor> _favoriteCounselors = []; // 찜한 상담사 목록

  // 찜한 상담사 리스트 Getter
  List<Counselor> get favoriteCounselors => _favoriteCounselors;

  // 상담사를 찜하거나 찜 해제
  void toggleFavorite(Counselor counselor) {
    if (_favoriteCounselors.contains(counselor)) {
      _favoriteCounselors.remove(counselor); // 이미 찜되어 있다면 제거
    } else {
      _favoriteCounselors.add(counselor); // 찜하지 않은 상태라면 추가
    }
    notifyListeners(); // UI 업데이트 알림
  }

  // 특정 상담사가 찜 상태인지 확인
  bool isFavorited(Counselor counselor) {
    return _favoriteCounselors.contains(counselor);
  }
}
