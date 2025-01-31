import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:renewus/pages/login_page/widgets/logo.dart';

class EmailLogin extends StatefulWidget {
  const EmailLogin({super.key});

  @override
  State<EmailLogin> createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  final TextEditingController _idTextController = TextEditingController();
  final TextEditingController _pswdTextController = TextEditingController();

  @override
  void dispose() {
    _idTextController.dispose();
    _pswdTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이메일로 계속하기'),
      ),
      body: Column(
        children: [
          SizedBox(height: 100),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Logo(),
                SizedBox(height: 100),
                TextField(
                  controller: _idTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '이메일',
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _pswdTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '비밀번호',
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      print('시작하기');
                    },
                    child: Text('시작하기'),
                  ),
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: '회원이 아니신가요? ',
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: '여기를 클릭해주세요',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('로그인');
                          },
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: '비밀번호가 기억나지 않나요? ',
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: '여기를 클릭해주세요',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('로그인');
                          },
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
