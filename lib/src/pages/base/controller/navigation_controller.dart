import 'package:flutter/material.dart';

abstract class NavigationTabs {
  static const int home = 0;
}

class NavigationController {
  final PageController pageController =
      PageController(initialPage: NavigationTabs.home);
  final ValueNotifier<int> currentIndex =
      ValueNotifier<int>(NavigationTabs.home);

  void navigatePageView(int page) {
    if ([currentIndex.value, 2].contains(page)) return;

    currentIndex.value = page;
    // pageController.jumpToPage(page);
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 700),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }
}
