import 'package:flutter/material.dart';
import 'package:renewus/data/model/counselor.dart';
import 'package:renewus/widgets/custom_app_bar.dart';

class CounselorDetail extends StatelessWidget {
  final Counselor counselor;
  const CounselorDetail({super.key, required this.counselor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('상담사 프로필'),
      bottomSheet: Container(
        height: 100,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.favorite_border, color: Colors.grey),
            ),
            SizedBox(width: 16),
            Container(
              width: 300,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('상담신청',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              topElement(context),
              SizedBox(height: 15),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: double.infinity,
                  height: 90,
                  color: Colors.blue[100],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "\n*리뉴어스 상담사는 윤리규정에 의거하여 내담자의 사생활과 비밀보호를 철저히 보장합니다"),
                  ),
                ),
              ),
              SizedBox(height: 15),
              ClipRRect(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '서비스 설명',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(counselor.introduction ?? '상담사 소개가 없습니다.')
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              ClipRRect(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '상담 가능시간 및 진행방식',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(counselor.introduction ?? '상담사 소개가 없습니다.')
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              ClipRRect(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '싱딤사가 생각하는 부부관계란?',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(counselor.personalOpinion ?? '상담사 소개가 없습니다.')
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row topElement(BuildContext context) {
    return Row(
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
        SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(counselor.counselorName!,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(width: 15),
                Icon(Icons.star, color: Colors.amber, size: 16),
                Text(counselor.rating.toString()),
                SizedBox(width: 10),
                Text('후기(' + counselor.reviews!.length.toString() + ')',
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('경력'),
                SizedBox(width: 20),
                Container(
                  height: 115,
                  width: MediaQuery.of(context).size.width - 200,
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: counselor.profiles!.length,
                            itemBuilder: (countext, index) {
                              return Text(counselor.profiles![index]!);
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
