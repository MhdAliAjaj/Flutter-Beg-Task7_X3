import 'package:flutter/material.dart';
import 'package:task_7_x3/core/style/app_color.dart';

class FeildLabel extends StatelessWidget {
  final String label;
  const FeildLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: AppColor.textHint,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
    );
  }
}
