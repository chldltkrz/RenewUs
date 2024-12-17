import 'package:flutter/material.dart';
import 'package:renewus/pages/category_main_page/widgets/counselor_search_body_tab.dart';
import 'package:renewus/pages/counseling_main_page/counseling_main_page.dart';

class CommonBottomSheet extends StatefulWidget {
  @override
  _CommonBottomSheetState createState() => _CommonBottomSheetState();
}

class _CommonBottomSheetState extends State<CommonBottomSheet> {
  int _currentIndex = 0;

  // Pages for Navigation
  final List<Widget> _pages = [
    CounselorSearchBodyTab(),
    PersonalityTestPage(),
    RecommendedCounselorsPage(),
    CounselingMainPage(), // Page for "상담 하기"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected index
          });

          // Navigate to "상담 하기" if it's selected
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CounselingMainPage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "홈",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "성격 검사",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "추천 상담사",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "상담 하기",
          ),
        ],
      ),
    );
  }
}

class RecommendedCounselorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('상담사추천'),
    );
  }
}

class PersonalityTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('성격검사'),
    );
  }
}
