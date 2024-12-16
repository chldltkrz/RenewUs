import 'package:flutter/material.dart';
import 'package:renewus/widgets/custom_appbar.dart'; // 앱바 불러오기
import 'package:renewus/widgets/main_bottom_sheet.dart'; // 바텀시트 불러오기

class MyReviewPage extends StatelessWidget {
  final List<Map<String, dynamic>> reviewList = [
    {
      'isReviewed': false,
      'counselor': '오호라',
      'date': '2024-12-10', // 날짜 포맷 변경 (정렬을 위해 ISO 8601 형태 사용)
      'time': '23:30',
      'duration': '30분',
      'review': '어ㅣㅏㄴ어리ㅏ어ㅏㅣㄹ너이;러;ㄴ얼;ㅣㄴ이;나;ㅣㅏ;ㄴ이ㅏ;ㅣㄴ아;ㅣㅏㅇ;ㅣㅏㄴ;ㅣ아ㅣ;ㅏㄴ;ㅣㅏㅣ;ㅏㅣ;ㅏ',
      'rating': 5.0,
    },
    {
      'isReviewed': false,
      'counselor': '김상담사',
      'date': '2024-11-15',
      'time': '14:30',
      'duration': '45분',
      'review':
          '상담 내용이 매우 유익했어요. 상담중에 유연하게 상담시간을 연장할 수 있는것도 너무 좋은 것 같아요. 앞으로도 자주 이용하고 싶습니다.',
      'rating': 4.5,
    },
    {
      'isReviewed': true,
      'counselor': '가나다',
      'date': '2024-11-16',
      'time': '20:30',
      'duration': '30분',
      'review': '고민하다가 짧게나마 상담 신청했는데 다음엔 좀더 오래 심도있는 상담을 받아보고 싶네요. ',
      'rating': 4.5,
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
            // 노란색 박스
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
            SizedBox(height: 16), // 간격

            // 상담 내역 리스트
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: sortedReviewList.length,
                itemBuilder: (context, index) {
                  final review = sortedReviewList[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 16, top: 16, bottom: 2, right: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xFFF4BA3E)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 상담사 사진
                              Container(
                                margin: EdgeInsets.only(top: 4), // 텍스트 높이와 맞춤
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      'https://via.placeholder.com/150'),
                                ),
                              ),
                              SizedBox(width: 10),
                              // 상담 정보
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      review['isReviewed']
                                          ? '완료된 상담'
                                          : '완료된 상담 [리뷰 미작성]',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: review['isReviewed']
                                            ? Colors.black
                                            : Colors.red,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text('상담사 : ${review['counselor']}'),
                                    Text('날짜 : ${review['date']}'),
                                    Text('시간 : ${review['time']}'),
                                    Text('이용시간 : ${review['duration']}'),
                                    if (review['isReviewed'])
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Text(
                                          '리뷰 : ${review['review']}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // 텍스트 버튼
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: TextButton(
                                onPressed: () {
                                  // 리뷰 상세 보기 페이지 이동
                                },
                                child: Text(
                                  review['isReviewed']
                                      ? '나의 리뷰 ★${review['rating']} >'
                                      : '리뷰쓰기 >',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFF4BA3E),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 100), // 추가 여유 공간
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
