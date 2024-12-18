import 'package:flutter/material.dart';
import 'package:renewus/pages/category_main_page/widgets/common_bottom_sheet.dart';
import 'package:renewus/pages/category_main_page/widgets/counselor_search_appbar.dart';
import 'package:renewus/pages/category_main_page/widgets/counselor_search_body_tab.dart';

class CategoryMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CounsellerSearchAppbar(), // AppBar가 여기에 제대로 설정되어야 함
      body: CounselorSearchBodyTab(),
      bottomNavigationBar: CommonBottomSheet(),
    );
  }
}
