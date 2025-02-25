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
        ],
      ),
    ]);
  }
}
