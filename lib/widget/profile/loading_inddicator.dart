import 'package:flutter/material.dart';
import 'package:task_7_x3/core/style/app_color.dart';

class LoadingInddicator extends StatelessWidget {
  const LoadingInddicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: AppColor.primary),
          const SizedBox(height: 16),
          Text(
            'Loading profile...',
            style: TextStyle(color: AppColor.textHint, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
