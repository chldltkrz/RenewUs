import 'package:flutter/material.dart';
import 'package:renewus/core/snackbar_util.dart';
import 'package:renewus/data/model/user.dart';
import 'package:renewus/data/repository/user_repository.dart';
import 'package:renewus/pages/home_page/home_page.dart';

class NoLogin extends StatefulWidget {
  const NoLogin({super.key});

  @override
  State<NoLogin> createState() => _NoLoginState();
}

class _NoLoginState extends State<NoLogin> {
  final TextEditingController _nicknameController = TextEditingController();
  bool _isDuplicationChecked = false;
  bool _isDuplication = false;

  Future<bool> signIn(String userName) async {
    try {
      return await UserReporisotry().insert(
        userEmail: '',
        userName: userName,
        appointments: [],
        favoriteCounselors: [],
        chargedMoney: 0,
        imageUrl: '',
        isCounselor: false,
      );
    } catch (e) {
      debugPrint('Error: $e');
      return false;
    }
  }

  Future<void> duplicationCheck(String userName) async {
    try {
      if (userName.isEmpty) {
        SnackbarUtil.showSnackBar(context, '닉네임을 입력해주세요');
        return;
      }
      User? user = await UserReporisotry().searchUser(userName);
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
      appBar: AppBar(
        title: const Text('가입 없이 바로 시작'),
      ),
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
                        bool success = await signIn(_nicknameController.text);
                        if (success) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        } else {
                          setState(() {
                            _isDuplicationChecked = false;
                          });
                          SnackbarUtil.showSnackBar(context, '회원가입에 실패했습니다');
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
