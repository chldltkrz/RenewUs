import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:renewus/core/snackbar_util.dart';
import 'package:renewus/pages/join_page/widgets/email_join_page.dart';
import 'package:renewus/pages/login_page/login_page.dart';
import 'package:renewus/pages/login_page/widgets/logo.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({super.key});

  void signUp(String email, String password) {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        print(value);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      debugPrint('에러');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 120),
                Logo(),
                SizedBox(height: 150),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      SnackbarUtil.showSnackBar(context, '카카오 로그인은 준비중입니다');
                    },
                    child: Text('카카오로 회원가입'),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmailJoinPage()));
                    },
                    child: Text('이메일로 회원가입'),
                  ),
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: '이미 가입되어 있나요? ',
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: '여기를 클릭해 로그인해주세요',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
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
                    text: '혹시 상담사이신가요? ',
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
        ),
      ),
    );
  }
}
