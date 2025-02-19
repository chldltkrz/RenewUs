import 'package:flutter/material.dart';
import 'package:renewus/pages/home_page/_tab/home_tab/_home_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => {_tabController.animateTo(value)},
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                  AssetImage('assets/icons/tabler-icon-clipboard-heart.png')),
              label: '심리분석'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                  AssetImage('assets/icons/tabler-icon-clipboard-heart.png')),
              label: '맞춤상담사'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                  AssetImage('assets/icons/tabler-icon-clipboard-heart.png')),
              label: '내공간'),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HomeTab(),
          Container(
            child: Center(
              child: Text('심리분석'),
            ),
          ),
          Container(
            child: Center(
              child: Text('맞춤상담사'),
            ),
          ),
          Container(
            child: Center(
              child: Text('내공간'),
            ),
          ),
        ],
      ),
    );
  }
}
