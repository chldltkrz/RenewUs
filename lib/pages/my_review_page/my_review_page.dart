import 'package:flutter/material.dart';
import 'package:renewus/widgets/custom_appbar.dart';
import 'package:renewus/widgets/main_bottom_sheet.dart';
import 'package:renewus/widgets/review_card.dart';

class MyReviewPage extends StatelessWidget {
  final List<Map<String, dynamic>> reviewList = [
    {
      'isReviewed': false,
      'counselor': '오호라',
      'date': '2024-12-10',
      'time': '23:30',
      'duration': '30분',
      'review': '어ㅣㅏㄴ어리ㅏ어ㅏㅣㄹ너이;러;ㄴ얼;ㅣㄴ이;나;ㅣㅏ;ㅆㅏ',
      'rating': 5.0,
      'imageUrl': 'https://via.placeholder.com/150',
    },
    {
      'isReviewed': false,
      'counselor': '김상담사',
      'date': '2024-11-15',
      'time': '14:30',
      'duration': '45분',
      'review': '상담 내용이 매우 유익했어요. 상담중에 유연하게 상담시간을 연장할 수 있는것도 너무 좋은 것 같아요.',
      'rating': 4.5,
      'imageUrl': 'https://via.placeholder.com/150',
    },
    {
      'isReviewed': true,
      'counselor': '가나다',
      'date': '2024-11-16',
      'time': '20:30',
      'duration': '30분',
      'review': '고민하다가 짧게나마 상담 신청했는데 다음엔 좀더 오래 심도있는 상담을 받아보고 싶네요.',
      'rating': 4.5,
      'imageUrl': 'https://via.placeholder.com/150',
    },
    {
      'isReviewed': true,
      'counselor': '최쵝오',
      'date': '2024-12-09',
      'time': '23:30',
      'duration': '50분',
      'review':
          '늦은 시간에 갑자기 상담요청을 했는데 빠르고 친절한 상담이 인상깊었습니다. 한번만으로 많은게 변할거라 생각하진 않지만 그래도 도움이 많이 된 것 같고 지속적으로 상담을 받아보고 싶네요.',
      'rating': 5.0,
      'imageUrl': 'https://via.placeholder.com/150',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // 리뷰 미작성된 상담과 작성된 상담을 각각 정렬
    List<Map<String, dynamic>> sortedReviewList = [
      ...reviewList.where((review) => !review['isReviewed']).toList()
        ..sort((a, b) => b['date'].compareTo(a['date'])), // 날짜 내림차순
      ...reviewList.where((review) => review['isReviewed']).toList()
        ..sort((a, b) => b['date'].compareTo(a['date'])), // 날짜 내림차순
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
                    counselorName: review['counselor'],
                    date: review['date'],
                    time: review['time'],
                    duration: review['duration'],
                    reviewText: review['review'],
                    isReviewed: review['isReviewed'],
                    rating: review['rating'],
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
