import 'package:flutter/material.dart';
import 'package:renewus/pages/counselor_profile_page/widgets/counselor_profile_page_bottom_navigation_bar.dart';
import 'package:renewus/widgets/custom_app_bar.dart';

class CounselorProfilePage extends StatelessWidget {
  final String counselorName;
  CounselorProfilePage(this.counselorName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('전문가 프로필'),
      bottomNavigationBar: CounselorProfilePageBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Image(
                    image: NetworkImage('https://picsum.photos/100/100'),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(counselorName + ' * 4.5'),
                      Text('30분 6만원'),
                      Text('50분 10만원'),
                      Text('비로상담가능'),
                      Center(
                        child: Container(
                          padding: EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: Colors.lightBlue[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '지금 더 나은 삶을 위한 선택을 도와드립니다.',
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '상담사 소개',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            '저는 15년 이상 부부상담 전문가로 부부간의 깨진 신뢰와 갈등 때문에 절망스러워도 적극적으로 노력한다면 얼마든지 희망이 있다는 것을 배웠습니다.  지금도 항상 보람을 느끼며 상담을 하고 있습니다. 저와 상담을 통해 회복과 희망의 첫걸음을 함께 해보면 어떨까요?'),
                        SizedBox(height: 20),
                        Text('이은총 상담사가 생각하는 부부관계란?'),
                        Text(
                            '부부관계는 마치 오미자의 단맛, 쓴맛 신맛 매운맛, 짠맛과 비슷합니다. 서로 다른 배경, 성격, 문화 속에 살아온 남녀가 만나서 싸우고 사랑하고 결국 서로를 이해하고 수용하며 성장하는 관계라고 여겨집니다.')
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '주요 자격 및 경력',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('''-교육학 상담전공 박사
-국제 공인 부부 관계 치료 전문가
-부부치료 교육 강사(한국 부부상담 연구소)
-한국상담학괴 전문상담사/ 임상심리사

전)정신건강 의학과 가족 상담사
전)대전 지방 법원 가사 상담 위원'''),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '38개의 후기',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            '선생님을 잘 만나서 남편과 서로 잘 이해하게 되었습니다. 왜 추천을 많이 하시는지 알것 같아요.'),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
