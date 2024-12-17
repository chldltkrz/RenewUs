import 'package:flutter/material.dart';
import 'package:renewus/pages/my_page/my_page.dart';

class CounsellerSearchAppbar extends StatefulWidget
    implements PreferredSizeWidget {
  const CounsellerSearchAppbar({
    super.key,
  });

  @override
  State<CounsellerSearchAppbar> createState() => _CounsellerSearchAppbarState();

  // 앱바의 높이를 60으로 설정
  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _CounsellerSearchAppbarState extends State<CounsellerSearchAppbar> {
  final searchTextFieldController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    searchTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: AppBar(
        backgroundColor: Color(0xFFD9DDE7),
        toolbarHeight: 60, // 앱바의 높이를 60으로 설정
        centerTitle: false,
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
                icon: Icon(Icons.notification_important,
                    color: Color(0xFF182233)),
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
                        builder: (context) => MyPage(favoritedCounselors: []),
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
      ),
    );
  }
}
