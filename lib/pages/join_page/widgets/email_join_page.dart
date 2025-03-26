import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:renewus/core/snackbar_util.dart';
import 'package:renewus/pages/home_page/home_page.dart';
import 'package:renewus/pages/join_page/join_page.dart';
import 'package:renewus/pages/join_page/widgets/nickname_join_page.dart';
import 'package:renewus/widgets/custom_app_bar.dart';

class EmailJoinPage extends StatefulWidget {
  const EmailJoinPage({super.key});

  @override
  State<EmailJoinPage> createState() => _EmailJoinPageState();
}

class _EmailJoinPageState extends State<EmailJoinPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('이메일로 회원가입'),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('이메일'),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '이메일을 입력해주세요',
                  ),
                ),
                SizedBox(height: 20),
                Text('비밀번호'),
                TextField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '비밀번호를 입력해주세요',
                  ),
                ),
                SizedBox(height: 20),
                Text('비밀번호 확인'),
                TextField(
                  obscureText: true,
                  controller: _passwordConfirmController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '비밀번호를 다시 입력해주세요',
                  ),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            SafeArea(
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_passwordController.value.text.trim() !=
                          _passwordConfirmController.value.text.trim()) {
                        SnackbarUtil.showSnackBar(context, '비밀번호가 일치하지 않습니다');
                        return;
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NicknameJoinPage(
                                    email: _emailController.value.text.trim(),
                                    password:
                                        _passwordController.value.text.trim(),
                                  )));
                    },
                    child: Text('회원가입'),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
