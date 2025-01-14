import 'package:flutter/material.dart';
import 'package:renewus/pages/category_main_page/widgets/category_main_page_bottom_navigationbar.dart';
import 'package:renewus/widgets/custom_app_bar_search.dart';

class CategoryMainPage extends StatelessWidget {
  const CategoryMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarSearch("this is category main page"),
      body: CategoryMainPageBottomNavigationbar(),
    );
  }
}
