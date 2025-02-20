import 'package:flutter/material.dart';
import 'package:renewus/widgets/custom_app_bar_search.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarSearch('RenewUs'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '어떤 고민이 있으신가요?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      selectCategory(Colors.blue[200]!, Icons.home, '아이양육'),
                      selectCategory(Colors.green[200]!, Icons.home, '의사소통'),
                      selectCategory(Colors.yellow[200]!, Icons.home, '재정관련'),
                      selectCategory(Colors.red[200]!, Icons.home, '성생활'),
                      selectCategory(Colors.green[200]!, Icons.home, '이혼이별'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                filterCategory(true, '초기화', false),
                SizedBox(width: 10),
                filterCategory(false, '경력순', true),
                SizedBox(width: 10),
                filterCategory(false, '바로상담', false),
                SizedBox(width: 10),
                filterCategory(false, '추천순', false),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return mainDescription(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding mainDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
                width: 90,
                height: 140,
                color: Colors.grey,
                child: Icon(Icons.health_and_safety)),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 140,
                child: Row(
                  children: [
                    Chip(
                      label: Container(
                        width: 35,
                        height: 14,
                        child: Text('바로상담',
                            style: TextStyle(color: Colors.blue, fontSize: 10)),
                      ),
                      backgroundColor: Colors.blue[50],
                    ),
                    SizedBox(width: 5),
                    Chip(
                      label: Container(
                        width: 20,
                        height: 14,
                        child: Text('추천',
                            style:
                                TextStyle(color: Colors.orange, fontSize: 10)),
                      ),
                      backgroundColor: Colors.orange[50],
                    ),
                    SizedBox(width: 5),
                    Chip(
                      label: Container(
                        width: 20,
                        height: 14,
                        child: Text('신규',
                            style: TextStyle(color: Colors.red, fontSize: 10)),
                      ),
                      backgroundColor: Colors.red[50],
                    ),
                    SizedBox(width: 5),
                    Spacer(),
                    Icon(Icons.favorite_border),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    '홍길동',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Text(' 4.7 '),
                  Text('후기(42개)', style: TextStyle(color: Colors.grey)),
                ],
              ),
              Text('상담경력: 12년'),
              SizedBox(
                width: MediaQuery.of(context).size.width - 140,
                child: Text('가족상담 전문가로 당신의 고민을 듣고 부부사이의 회복과 성장을 함께하겠습니다.'),
              ),
              Row(
                children: [
                  Text('채팅상담', style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 10),
                  Text('전화상담', style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 10),
                  Text('화상 상담', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector filterCategory(bool init, String text, bool showIcon) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        width: init
            ? 110
            : showIcon
                ? 100
                : 80,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            init ? Icon(Icons.refresh) : SizedBox(),
            SizedBox(width: 10),
            Text(text),
            showIcon ? Icon(Icons.arrow_drop_down) : SizedBox(),
          ],
        ),
      ),
    );
  }

  Padding selectCategory(Color color, IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () => {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 80,
            height: 80,
            color: color,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon),
                Text(text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
