import 'package:flutter/material.dart';
import 'package:renewus/pages/home_page/_tab/counseling_tab/counseling_tab.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(
                text: '실시간 상담',
              ),
              Tab(
                text: '예약 상담',
              ),
              Tab(
                text: '상담사 전용',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                CounselingTab(),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
