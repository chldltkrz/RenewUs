import 'package:flutter/material.dart';
import 'package:renewus/pages/category_main_page/widgets/category_main_page_appbar.dart';
import 'package:renewus/pages/category_main_page/widgets/category_main_page_bottom_navigationbar.dart';

class CategoryMainPage extends StatelessWidget {
  const CategoryMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CategpryMainPageAppbar("this is category main page"),
      body: CategoryMainPageBottomNavigationbar(),
    );
  }
}
