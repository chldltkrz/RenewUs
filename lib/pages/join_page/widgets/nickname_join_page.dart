import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:renewus/core/snackbar_util.dart';
import 'package:renewus/data/model/user.dart' as AppUser;
import 'package:renewus/data/repository/user_repository.dart';
import 'package:renewus/pages/home_page/home_page.dart';
import 'package:renewus/pages/join_page/join_page.dart';
import 'package:renewus/widgets/custom_app_bar.dart';

class NicknameJoinPage extends StatefulWidget {
  final String email;
  final String password;
  const NicknameJoinPage(
      {super.key, required this.email, required this.password});

  @override
  State<NicknameJoinPage> createState() => _NicknameJoinPageState();
}

class _NicknameJoinPageState extends State<NicknameJoinPage> {
  TextEditingController _nicknameController = TextEditingController();
  bool _isDuplicationChecked = false;
  bool _isDuplication = false;

  Future<void> duplicationCheck(String userName) async {
    try {
      if (userName.isEmpty) {
        SnackbarUtil.showSnackBar(context, '닉네임을 입력해주세요');
        return;
      }
      AppUser.User? user = await UserReporisotry().searchUser(userName);
      setState(() {
        _isDuplication = user != null ? true : false;
      });

      if (_isDuplication) {
        _isDuplicationChecked = false;
        SnackbarUtil.showSnackBar(context, '이미 아이디가 사용중입니다');
      } else {
        _isDuplicationChecked = true;
        SnackbarUtil.showSnackBar(context, '사용 가능한 닉네임입니다');
      }
    } catch (e) {
      debugPrint('Error: $e');
      SnackbarUtil.showSnackBar(context, '오류가 발생했습니다.');
    }
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('이메일로 회원가입'),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text('닉네임'),
              TextField(
                controller: _nicknameController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: '닉네임을 입력해주세요',
                  suffixIcon: IconButton(
                    onPressed: () => duplicationCheck(_nicknameController.text),
                    icon: const Text('중복확인'),
                  ),
                ),
              ),
              const Text(
                '한글, 영문, 숫자를 포함하여 4~15자리까지 가능합니다.',
                style: TextStyle(color: Colors.grey),
              ),
              if (_isDuplication)
                const Text('이미 아이디가 있습니다, 다른 닉네임을 입력해 주세요',
                    style: TextStyle(color: Colors.red)),
              const SizedBox(height: 24),
              const Spacer(),
              SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (!_isDuplication) {
                        if (_nicknameController.text.isEmpty) {
                          SnackbarUtil.showSnackBar(context, '닉네임을 입력해주세요');
                          return;
                        }
                        if (_isDuplicationChecked == false) {
                          SnackbarUtil.showSnackBar(context, '중복확인을 해주세요');
                          return;
                        }

                        try {
                          UserCredential cred = await JoinPage.signUp(
                              widget.email,
                              widget.password,
                              _nicknameController.value.text.trim());
                          if (cred.user != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          }
                        } catch (e) {
                          SnackbarUtil.showSnackBar(
                              context, '회원가입에 실패하였습니다' + e.toString());
                          setState(() {
                            _isDuplicationChecked = false;
                          });
                        }
                      } else {
                        setState(() {
                          _isDuplicationChecked = false;
                        });
                        SnackbarUtil.showSnackBar(context, '다시 중복확인을 해주세요');
                      }
                    },
                    child: const Text('시작하기'),
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
