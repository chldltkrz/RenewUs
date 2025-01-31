import 'package:flutter/material.dart';
import 'package:renewus/pages/category_main_page/widgets/search_main_page_bottom_navigationbar.dart';
import 'package:renewus/widgets/custom_app_bar_search.dart';

class SearchMainPage extends StatelessWidget {
  const SearchMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarSearch(''),
      body: SearchMainPageBottomNavigationbar(),
    );
  }
}
