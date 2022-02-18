import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TabControllerNotifier extends StateNotifier<TabController?> {
  TabControllerNotifier() : super(null);

  void initialize(TabController tabController) {
    state = tabController;
  }
}

final tabControllerProvider =
    StateNotifierProvider<TabControllerNotifier, TabController?>((ref) {
  return TabControllerNotifier();
});
