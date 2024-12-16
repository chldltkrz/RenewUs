import 'package:flutter/material.dart';
import 'package:renewus/widgets/custom_appbar.dart';

class CategoryMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '카테고리 페이지'),
      body: ListView(
        children: [
          ListTile(
            title: Text('부부 상담'),
            onTap: () {
              Navigator.pushNamed(context, '/counselorList');
            },
          ),
          ListTile(
            title: Text('개인 상담'),
            onTap: () {
              Navigator.pushNamed(context, '/counselorList');
            },
          ),
          ListTile(
            title: Text('심리 상담'),
            onTap: () {
              Navigator.pushNamed(context, '/counselorList');
            },
          ),
        ],
      ),
    );
  }
}
