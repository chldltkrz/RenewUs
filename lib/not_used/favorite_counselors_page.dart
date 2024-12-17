import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteCounselorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteCounselors =
        Provider.of<FavoriteCounselorProvider>(context).favoriteCounselors;

    return Scaffold(
      appBar: AppBar(
        title: Text('찜한 상담사'),
      ),
      body: favoriteCounselors.isEmpty
          ? Center(
              child: Text('찜한 상담사가 없습니다.'),
            )
          : ListView.builder(
              itemCount: favoriteCounselors.length,
              itemBuilder: (context, index) {
                final counselor = favoriteCounselors[index];
                return Card(
                  child: ListTile(
                    title: Text(counselor.name),
                    subtitle: Text(counselor.description),
                    trailing: Icon(Icons.favorite, color: Colors.red),
                  ),
                );
              },
            ),
    );
  }
}
