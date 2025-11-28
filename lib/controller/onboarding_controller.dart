import 'package:flutter/material.dart';

class OnboardingController {
  final PageController pageController = PageController();
  int currentPage = 0;

  void nextPage(VoidCallback refresh) {
    if (currentPage < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      currentPage++;
      refresh();
    } else {
      // Navigate to home or login
    }
  }

  void onPageChanged(int index, VoidCallback refresh) {
    currentPage = index;
    refresh();
  }
}
