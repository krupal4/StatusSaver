import 'package:flutter_riverpod/flutter_riverpod.dart';

const recentTabIndex = 0;
const savedTabIndex = 1;

class SelectedTabNotifier extends Notifier<int> {
  @override
  int build() {
    return recentTabIndex;
  }

  void set(int selectedIndex) {
    state = selectedIndex;
  }
}

final selectedTabIndexProvider =
    NotifierProvider<SelectedTabNotifier, int>(SelectedTabNotifier.new);
