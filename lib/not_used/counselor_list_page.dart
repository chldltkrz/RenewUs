import 'package:flutter/material.dart';
import 'package:renewus/data/model/counselor.dart';

class CounselorListPage extends StatelessWidget {
  final List<Counselor> counselors;

  CounselorListPage({required this.counselors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '찜한 상담사',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrangeAccent, // AppBar 색상 변경
        centerTitle: true, // 가운데 정렬
      ),
      body: counselors.isEmpty
          ? Center(
              child: Text(
                '찜한 상담사가 없습니다.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            )
          : ListView.builder(
              itemCount: counselors.length,
              itemBuilder: (context, index) {
                final counselor = counselors[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 상담사 이름과 별점
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              counselor.counselorName,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 20),
                                SizedBox(width: 4),
                                Text(
                                  counselor.rating.toStringAsFixed(1),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 8),

                        // 상담 가격
                        Text(
                          '30분: ₩${counselor.price30Min.toStringAsFixed(0)} | '
                          '50분: ₩${counselor.price50Min.toStringAsFixed(0)}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 8),

                        // 간략한 설명
                        Text(
                          counselor.introduction,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),

                        // 카드 하단 여백
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
