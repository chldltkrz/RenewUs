import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:renewus/pages/category_main_page/category_main_page_view_model.dart';

class CounselorSearchBodyTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainTabIndex = ref.watch(categoryMainPageViewModel);
    final sortingIndex = ref.watch(sortingViewModel);

    return SafeArea(
      child: Column(
        children: [
          // Main Tab Filter Buttons
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                mainFilterButton(context, ref, '부부상담', 0, mainTabIndex),
                mainFilterButton(context, ref, '심야상담', 1, mainTabIndex),
                mainFilterButton(context, ref, '상담사전용', 2, mainTabIndex),
              ],
            ),
          ),
          // Sorting Filter Buttons (경력순, 가격순, ...)
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                sortingButton(context, ref, '경력순', 0, sortingIndex),
                sortingButton(context, ref, '가격순', 1, sortingIndex),
                sortingButton(context, ref, '바로상담가능순', 2, sortingIndex),
                sortingButton(context, ref, '오프라인 가까운순', 3, sortingIndex),
              ],
            ),
          ),
          // IndexedStack for Main Tab
          Expanded(
            child: IndexedStack(
              index: mainTabIndex,
              children: [
                gridViewForSorting(sortingIndex),
                gridViewForSorting(sortingIndex),
                gridViewForSorting(sortingIndex),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Main Filter Button
  Widget mainFilterButton(BuildContext context, WidgetRef ref, String label,
      int index, int currentIndex) {
    return GestureDetector(
      onTap: () {
        ref.read(categoryMainPageViewModel.notifier).onMainTabChanged(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: currentIndex == index ? Colors.blueAccent : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: currentIndex == index ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Sorting Button
  Widget sortingButton(BuildContext context, WidgetRef ref, String label,
      int index, int sortingIndex) {
    return GestureDetector(
      onTap: () {
        ref.read(sortingViewModel.notifier).onSortingChanged(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: sortingIndex == index ? Colors.blueAccent : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: sortingIndex == index ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // GridView that changes based on Sorting Index
  Widget gridViewForSorting(int sortingIndex) {
    List<String> sortedData = ['경력순', '가격순', '바로상담가능순', '오프라인 가까운순'];
    String currentSorting = sortedData[sortingIndex];

    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3 / 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              '$currentSorting $index',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}
