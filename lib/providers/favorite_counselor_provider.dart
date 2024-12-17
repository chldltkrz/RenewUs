import 'package:flutter/material.dart';

class Counselor {
  final String id;
  final String name;
  final String description;

  Counselor({required this.id, required this.name, required this.description});
}

class FavoriteCounselorProvider with ChangeNotifier {
  final List<Counselor> _favoriteCounselors = [];

  List<Counselor> get favoriteCounselors => _favoriteCounselors;

  void toggleFavorite(Counselor counselor) {
    if (_favoriteCounselors.contains(counselor)) {
      _favoriteCounselors.remove(counselor);
    } else {
      _favoriteCounselors.add(counselor);
    }
    notifyListeners();
  }

  bool isFavorited(Counselor counselor) {
    return _favoriteCounselors.contains(counselor);
  }
}
