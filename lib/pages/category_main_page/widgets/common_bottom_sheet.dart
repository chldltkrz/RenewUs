import 'package:flutter/material.dart';

class CommonBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: "성격 검사"),
        BottomNavigationBarItem(icon: Icon(Icons.star), label: "추천 상담사"),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: "상담 하기"),
      ],
    );
  }
}
