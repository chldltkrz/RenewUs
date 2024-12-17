import 'package:flutter/material.dart';
import 'package:renewus/widgets/custom_appbar.dart';
import 'package:renewus/widgets/main_bottom_sheet.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '새 메세지'),
      body: Center(
        child: Text("알림과 메세지 목록이 비어있습니다."),
      ),
    );
  }
}
