import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:renewus/core/snackbar_util.dart';
import 'package:renewus/pages/home_page/home_page.dart';
import 'package:renewus/pages/join_page/join_page.dart';
import 'package:renewus/pages/login_page/widgets/logo.dart';

class EmailLogin extends StatefulWidget {
  const EmailLogin({super.key});

  @override
  State<EmailLogin> createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  final TextEditingController _idTextController = TextEditingController();
  final TextEditingController _pswdTextController = TextEditingController();

  Future<UserCredential> signIn(String email, String password) async {
    try {
      return await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      debugPrint('에러: $e');
      rethrow;
    }
  }

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
                  obscureText: true,
                  controller: _pswdTextController,
                  keyboardType: TextInputType.visiblePassword,
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
                    onPressed: () async {
                      try {
                        UserCredential cred = await signIn(
                            _idTextController.value.text.trim(),
                            _pswdTextController.value.text.trim());

                        if (cred.user != null) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        }
                      } catch (e) {
                        SnackbarUtil.showSnackBar(
                            context, '로그인에 실패했습니다' + e.toString());
                      }
                    },
                    child: Text('로그인'),
                  ),
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: '회원이 아니신가요? ',
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: '회원가입',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => JoinPage()));
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
                    text: '비밀번호를 잊으셨나요? ',
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: '비밀번호 찾기',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('비밀번호 찾기 클릭');
                          },
                        style: TextStyle(
                          color: Colors.grey,
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
