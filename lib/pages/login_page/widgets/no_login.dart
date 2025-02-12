import 'package:flutter/material.dart';

class NoLogin extends StatefulWidget {
  const NoLogin({super.key});

  @override
  State<NoLogin> createState() => _NoLoginState();
}

class _NoLoginState extends State<NoLogin> {
  final TextEditingController _nicknameController = TextEditingController();

  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('가입없이 바로시작'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text('닉네임'),
              TextField(
                controller: _nicknameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '닉네임을 입력해주세요',
                  suffixIcon: IconButton(
                    onPressed: () => {},
                    icon: Text('중복확인'),
                  ),
                ),
              ),
              Text('한글, 영문, 숫자를 포함하여 4~15자리까지 가능합니다.',
                  style: TextStyle(color: Colors.grey)),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => {},
                  child: Text('시작하기'),
                ),
              ),
            ],
          ),
        ));
  }
}
