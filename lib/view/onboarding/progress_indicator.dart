import 'package:flutter/material.dart';
import 'package:task_7_x3/core/style/appcolor.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final int currentIndex;

  const ProgressIndicatorWidget({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        final isActive = index == currentIndex;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: isActive ? 25 : 8,
          height: 4,
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.onboardingButtonBg
                : AppColors.onboardingSubtext.withOpacity(0.4),
            borderRadius: BorderRadius.circular(2),
          ),
        );
      }),
    );
  }
}
