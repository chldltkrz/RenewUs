import 'package:flutter/material.dart';
import 'package:renewus/pages/counselor_profile_page/counselor_profile_page.dart';

class CounselingTab extends StatelessWidget {
  const CounselingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  print('tapped');
                },
                child: Container(
                  color: Colors.black12,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text('경력순'),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('tapped');
                },
                child: Container(
                  color: Colors.black12,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text('가격순'),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('tapped');
                },
                child: Container(
                  color: Colors.black12,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text('바로상담가능순'),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('tapped');
                },
                child: Container(
                  color: Colors.black12,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text('오프라인 가까운순'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.6),
            itemCount: 9,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CounselorProfilePage('이은총'),
                  ),
                );
              },
              child: Column(
                children: [
                  Image.network('https://picsum.photos/100/100'),
                  const SizedBox(height: 8),
                  Text('이은총 ★5.0'),
                  Text('30분 6만원'),
                  Text('50분 10만원'),
                  Text('바로상담가능'),
                  Text('이력보기>'),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
