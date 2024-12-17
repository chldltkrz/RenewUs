import 'package:flutter/material.dart';

class CounsellerSearchAppbar extends StatefulWidget
    implements PreferredSizeWidget {
  const CounsellerSearchAppbar({
    super.key,
  });

  @override
  State<CounsellerSearchAppbar> createState() => _CounsellerSearchAppbarState();
  @override
  Size get preferredSize => const Size.fromHeight(80);
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
    return AppBar(
      backgroundColor: Color(0xFFD9DDE7),
      toolbarHeight: 80,
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
              icon:
                  Icon(Icons.notification_important, color: Color(0xFF182233)),
              onPressed: () {},
            ),
            Icon(Icons.account_circle, color: Color(0xFF182233)),
          ],
        ),
      ),
    );
  }
}
