import 'package:flutter/material.dart';
import 'package:renewus/pages/home_page/home_page.dart';

class SearchMainPageBottomNavigationbar extends StatefulWidget {
  const SearchMainPageBottomNavigationbar({super.key});

  @override
  State<SearchMainPageBottomNavigationbar> createState() =>
      _SearchMainPageBottomNavigationbarState();
}

class _SearchMainPageBottomNavigationbarState
    extends State<SearchMainPageBottomNavigationbar> {
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
            label: '심리분석',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '맞춤상담사',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '내공간',
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
