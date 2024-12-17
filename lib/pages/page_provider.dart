import 'package:flutter_riverpod/flutter_riverpod.dart';

// 페이지 이동 상태 관리 (현재 페이지 저장)
final pageProvider = StateNotifierProvider<PageNotifier, String>((ref) {
  return PageNotifier();
});

class PageNotifier extends StateNotifier<String> {
  PageNotifier() : super('join'); // 초기 상태

  void setPage(String page) {
    state = page;
  }
}