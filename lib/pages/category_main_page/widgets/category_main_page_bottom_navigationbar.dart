import 'package:flutter/material.dart';
import 'package:renewus/pages/home_page/home_page.dart';

class CategoryMainPageBottomNavigationbar extends StatefulWidget {
  const CategoryMainPageBottomNavigationbar({super.key});

  @override
  State<CategoryMainPageBottomNavigationbar> createState() =>
      _CategoryMainPageBottomNavigationbarState();
}

class _CategoryMainPageBottomNavigationbarState
    extends State<CategoryMainPageBottomNavigationbar> {
  var _index = 0;
  List<Widget> _pages = [
    HomePage(),
    Text('2'),
    Text('3'),
    Text('4'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black12,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '성격검사',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '추천상담사',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '나의상담',
          ),
        ],
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}
