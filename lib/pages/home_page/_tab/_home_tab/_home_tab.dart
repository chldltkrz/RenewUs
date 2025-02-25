import 'package:flutter/material.dart';
import 'package:renewus/data/model/counselor.dart';
import 'package:renewus/data/repository/counselor_repository.dart';
import 'package:renewus/pages/home_page/_tab/_home_tab/widgets/counselor_detail.dart';
import 'package:renewus/widgets/custom_app_bar_search.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  final counselorData = CounselorRepository().getAll();

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
            FutureBuilder(
              future: counselorData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return mainDescription(context, snapshot.data![index]);
                      },
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Container mainDescription(BuildContext context, Counselor counselor) {
    return Container(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CounselorDetail(counselor: counselor)))
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    width: 90,
                    height: 140,
                    color: Colors.grey,
                    child: counselor.imageUrl!.length > 0
                        ? Image.network(
                            counselor.imageUrl!,
                            fit: BoxFit.cover,
                          )
                        : Icon(Icons.health_and_safety)),
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
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 10)),
                          ),
                          backgroundColor: Colors.blue[50],
                        ),
                        SizedBox(width: 5),
                        Chip(
                          label: Container(
                            width: 20,
                            height: 14,
                            child: Text('추천',
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 10)),
                          ),
                          backgroundColor: Colors.orange[50],
                        ),
                        SizedBox(width: 5),
                        Chip(
                          label: Container(
                            width: 20,
                            height: 14,
                            child: Text('신규',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 10)),
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
                        counselor.counselorName ?? '이름없음',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(counselor.rating.toString()),
                      Text('후기(' + counselor.reviews!.length.toString() + ')',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Text('상담경력:' + counselor.totalCareer.toString() + '년'),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 140,
                    child: Text(
                      counselor.introduction ?? '소개없음',
                      maxLines: 2,
                    ),
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
        ),
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
