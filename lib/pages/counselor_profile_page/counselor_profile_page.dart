import 'package:flutter/material.dart';
import 'package:renewus/pages/counselor_reservation_page/counselor_reservation_page.dart';
import 'package:renewus/widgets/custom_appbar.dart'; // 앱바 불러오기
import 'package:renewus/widgets/counselor_profile_bottom_sheet.dart'; // 바텀시트 불러오기
import 'package:renewus/pages/counselor_profile_page/widgets/counselor_review.dart'; // 리뷰 페이지 이동
import 'package:renewus/themes/app_themes.dart';

class CounselorProfilePage extends StatefulWidget {
  final String counselorName;
  final List<String> favoritedCounselors;

  const CounselorProfilePage({
    Key? key,
    required this.counselorName,
    required this.favoritedCounselors,
  }) : super(key: key);

  @override
  _CounselorProfilePageState createState() => _CounselorProfilePageState();
}

class _CounselorProfilePageState extends State<CounselorProfilePage> {
  late bool isFavorited;

  @override
  void initState() {
    super.initState();
    isFavorited = widget.favoritedCounselors.contains(widget.counselorName);
  }

  void toggleFavorite() {
    setState(() {
      if (isFavorited) {
        widget.favoritedCounselors.remove(widget.counselorName);
      } else {
        widget.favoritedCounselors.add(widget.counselorName);
      }
      isFavorited = !isFavorited;
    });
  }

  void onReservePressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CounselorReservationPage(),
      ),
    );
  }

  void onFavoriteToggle() {
    toggleFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '전문가 프로필'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 상담사 사진과 정보
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage('https://i.pravatar.cc/300?img=32'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${widget.counselorName} ★4.5',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text('30분 6만원',
                            style: Theme.of(context).textTheme.bodyMedium),
                        Text('50분 10만원',
                            style: Theme.of(context).textTheme.bodyMedium),
                        Text('채팅/화상/심야 상담 가능',
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // 상담사 홍보 문구
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFFD9D6C9),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xFFD9D6C9)),
                ),
                child: Text(
                  '지금, 더 나은 삶을 위한 선택을 도와드립니다.',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppTheme.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 25),

              // 상담사 정보 박스들
              InfoBox(
                  title: '상담사 소개',
                  content:
                      '저는 15년 이상 부부상담 전문가로 부부간의 깨진 신뢰와 갈등 때문에 절망스러워도 적극적으로 노력한다면 얼마든지 희망이 있다는 것을 배웠습니다. 지금도 항상 보람을 느끼며 상담을 하고 있습니다. 저와 상담을 통해 회복과 희망의 첫걸음을 함께 해보면 어떨까요?\n \n이은총 상담사가 생각하는 부부관계란?\n부부관계는 마치 오미자의 단맛, 쓴맛 신맛 매운맛, 짠맛과 비슷합니다. 서로 다른 배경, 성격, 문화 속에 살아온 남녀가 만나서 싸우고 사랑하고 결국 서로를 이해하고 수용하며 성장하는 관계라고 여겨집니다.'),
              SizedBox(height: 10),
              InfoBox(
                title: '주요 자격 및 경력',
                content:
                    '-교육학 상담전공 박사\n-국제 공인 부부 관계 치료 전문가\n-부부치료 교육 강사(한국 부부상담 연구소)\n-한국상담학괴 전문상담사/ 임상심리사\n \n전)정신건강 의학과 가족 상담사\n전)대전 지방 법원 가사 상담 위원',
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CounselorReview(),
                    ),
                  );
                },
                child: InfoBox(
                  title: '38개의 상담 후기                                         >',
                  content:
                      '선생님을 잘 만나서 남편과 서로 잘 이해하게 되었습니다. 왜 추천을 많이 하시는지 알것 같아요.',
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomSheet: CounselorProfileBottomSheet(
        onReservePressed: onReservePressed,
        isFavorited: isFavorited,
        onFavoriteToggle: onFavoriteToggle,
      ),
    );
  }
}

// 상담사 정보 박스를 위한 공통 위젯
class InfoBox extends StatelessWidget {
  final String title;
  final String content;

  const InfoBox({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFFF4BA3E)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
