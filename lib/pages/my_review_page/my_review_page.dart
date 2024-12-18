import 'package:flutter/material.dart';
import 'package:renewus/pages/my_review_page/widgets/review_card.dart';
import 'package:renewus/widgets/custom_appbar.dart';
import 'package:renewus/widgets/main_bottom_sheet.dart';

class MyReviewPage extends StatelessWidget {
  final List<Map<String, dynamic>> reviewList = [
    {
      'username': '김민수',
      'counselorName': '오호라',
      'appointmentDate': DateTime(2024, 12, 10),
      'appointmentTime': '23:30',
      'duration': '30분',
      'extended': false,
      'createdAt': DateTime(2024, 12, 10),
      'finished': true,
      'imageUrl': 'https://i.pravatar.cc/80?img=45',
      'isReviewed': false,
      'review': {
        'reviewText': '어ㅣㅏㄴ어리ㅏ어ㅏㅣㄹ너이;러;ㄴ얼;ㅣㄴ이;나;ㅣㅏ;ㅆㅏ',
        'rating': 0.0,
      },
    },
    {
      'username': '김민수',
      'counselorName': '최쵝오',
      'appointmentDate': DateTime(2024, 11, 15),
      'appointmentTime': '14:30',
      'duration': '45분',
      'extended': false,
      'createdAt': DateTime(2024, 11, 15),
      'finished': true,
      'imageUrl': 'https://i.pravatar.cc/80?img=69',
      'isReviewed': true,
      'review': {
        'reviewText':
            '상담 내용이 매우 유익했어요. 상담중에 유연하게 상담시간을 연장할 수 있는것도 너무 좋은 것 같아요.',
        'rating': 4.5,
      },
    },
    {
      'username': '김민수',
      'counselorName': '가나다',
      'appointmentDate': DateTime(2024, 10, 25),
      'appointmentTime': '20:30',
      'duration': '50분',
      'extended': true,
      'createdAt': DateTime(2024, 10, 25),
      'finished': true,
      'imageUrl': 'https://i.pravatar.cc/80?img=12',
      'isReviewed': true,
      'review': {
        'reviewText': '고민하다가 짧게나마 상담 신청했는데 다음엔 좀더 오래 심도있는 상담을 받아보고 싶네요.',
        'rating': 4.5,
      },
    },
    {
      'username': '김민수',
      'counselorName': '이은총',
      'appointmentDate': DateTime(2024, 12, 12),
      'appointmentTime': '23:30',
      'duration': '50분',
      'extended': false,
      'createdAt': DateTime(2024, 12, 12),
      'finished': true,
      'imageUrl': 'https://i.pravatar.cc/80?img=32',
      'isReviewed': true,
      'review': {
        'reviewText':
            '늦은 시간에 갑자기 상담요청을 했는데 빠르고 친절한 상담이 인상깊었습니다. 한번만으로 많은게 변할거라 생각하진 않지만 그래도 도움이 많이 된 것 같고 지속적으로 상담을 받아보고 싶네요.',
        'rating': 5.0,
      },
    },
    {
      'username': '김민수',
      'counselorName': '아리랑',
      'appointmentDate': DateTime(2024, 11, 30),
      'appointmentTime': '22:00',
      'duration': '50분',
      'extended': false,
      'createdAt': DateTime(2024, 11, 30),
      'finished': true,
      'imageUrl': 'https://i.pravatar.cc/80?img=25',
      'isReviewed': true,
      'review': {
        'reviewText':
            '필요할때 심야 상담을 바로 받을 수 있는건 좋은 것 같아요. 그런데 조금더 깊은 얘기를 하기까진 시간이 필요한데 좀 급하게 물어보시는 느낌이 들어 아쉬웠습니다.',
        'rating': 4.0,
      },
    },
    {
      'username': '김민수',
      'counselorName': '이루다',
      'appointmentDate': DateTime(2024, 9, 15),
      'appointmentTime': '12:30',
      'duration': '45분',
      'extended': false,
      'createdAt': DateTime(2024, 9, 15),
      'finished': true,
      'imageUrl': 'https://i.pravatar.cc/80?img=23',
      'isReviewed': false,
      'review': {
        'reviewText':
            '쉽게 해결되지 않는 문제라 이런식으로 계속 상담만 받아도 될까 했는데 기대이상으로 도움이 많이 된 것 같습니다. 여태껏 받은 상담중에 가장 만족스러웠어요.',
        'rating': 4.5,
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    // 리뷰 미작성된 상담과 작성된 상담을 각각 정렬
    List<Map<String, dynamic>> sortedReviewList = [
      ...reviewList.where((review) => !review['isReviewed']).toList()
        ..sort((a, b) =>
            b['appointmentDate'].compareTo(a['appointmentDate'])), // 날짜 내림차순
      ...reviewList.where((review) => review['isReviewed']).toList()
        ..sort((a, b) =>
            b['appointmentDate'].compareTo(a['appointmentDate'])), // 날짜 내림차순
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(title: '나의 리뷰'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 45,
              color: Color(0xFFF4BA3E),
              child: Center(
                child: Text(
                  "자세하고 솔직한 리뷰를 토대로 보다 적합한 상담사를 추천 받을 수 있습니다.",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF473933),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 16),

            // 상담 내역 리스트
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: sortedReviewList.length,
                itemBuilder: (context, index) {
                  final review = sortedReviewList[index];
                  return ReviewCard(
                    counselorName: review['counselorName'],
                    date: review['appointmentDate'].toString().substring(0, 10),
                    time: review['appointmentTime'],
                    duration: review['duration'],
                    reviewText: review['review']['reviewText'],
                    isReviewed: review['isReviewed'],
                    rating: review['review']['rating'],
                    imageUrl: review['imageUrl'],
                  );
                },
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
      bottomSheet: MainBottomSheet(
        onHomePressed: () {},
        onPersonalityTestPressed: () {},
        onRecommendedCounselorPressed: () {},
        onConsultationPressed: () {},
        isHomeActive: true,
        isPersonalityTestActive: false,
        isRecommendedCounselorActive: false,
        isConsultationActive: false,
      ),
    );
  }
}
