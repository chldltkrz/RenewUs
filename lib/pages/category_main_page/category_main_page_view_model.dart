import 'package:flutter_riverpod/flutter_riverpod.dart';

// ViewModel for the main tab
class CategoryMainPageViewModel extends AutoDisposeNotifier<int> {
  @override
  int build() => 0; // Default to '부부상담'

  void onMainTabChanged(int newIndex) {
    state = newIndex;
  }
}

// ViewModel for the sorting tabs
class SortingViewModel extends AutoDisposeNotifier<int> {
  @override
  int build() => 0; // Default to '경력순'

  void onSortingChanged(int newIndex) {
    state = newIndex;
  }
}

// Providers
final categoryMainPageViewModel =
    NotifierProvider.autoDispose<CategoryMainPageViewModel, int>(
        () => CategoryMainPageViewModel());

final sortingViewModel = NotifierProvider.autoDispose<SortingViewModel, int>(
    () => SortingViewModel());
