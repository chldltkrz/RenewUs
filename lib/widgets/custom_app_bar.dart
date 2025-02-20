import 'package:flutter/material.dart';
import 'package:renewus/pages/home_page/home_page.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  CustomAppBar(this.title);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(centerTitle: true, title: Text(widget.title), actions: [
      Row(
        children: [
          IconButton(
            icon: Icon(Icons.notification_important, color: Color(0xFF182233)),
            onPressed: () {
              print("Notifications button pressed");
            },
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
                    builder: (context) => HomePage(),
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
    ]);
  }
}
