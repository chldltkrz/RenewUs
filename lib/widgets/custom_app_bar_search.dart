import 'package:flutter/material.dart';
import 'package:renewus/pages/category_main_page/category_main_page.dart';

class CustomAppBarSearch extends StatefulWidget implements PreferredSizeWidget {
  String title;

  CustomAppBarSearch(this.title);

  @override
  State<CustomAppBarSearch> createState() => _CustomAppBarSearchState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80);
}

class _CustomAppBarSearchState extends State<CustomAppBarSearch> {
  final searchTextFieldController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    searchTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFD9DDE7),
      toolbarHeight: 60, // 앱바의 높이를 60으로 설정
      centerTitle: true,
      title: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: searchTextFieldController,
                decoration: InputDecoration(
                  hintText: '상담사 검색',
                  prefixIcon: Icon(Icons.search, color: Color(0xFF182233)),
                  hintStyle: TextStyle(
                    color: Color(0xFF182233),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ),
            IconButton(
              icon:
                  Icon(Icons.notification_important, color: Color(0xFF182233)),
              onPressed: () {},
            ),
            Container(
              height: 50,
              width: 50,
              color: Colors.transparent,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryMainPage(),
                    ),
                  );
                },
                child: Icon(
                  Icons.account_circle,
                  color: Color(0xFF182233),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80);
}
