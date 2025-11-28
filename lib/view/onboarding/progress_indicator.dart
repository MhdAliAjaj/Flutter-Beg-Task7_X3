import 'package:flutter/material.dart';
import 'package:task7/core/style/app_color.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final int currentIndex;

  const ProgressIndicatorWidget({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        final color = index == currentIndex
            ? AppColor.progressActive
            : AppColor.progressInactive;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 30,
          height: 6,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }
}
