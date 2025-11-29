import 'package:flutter/material.dart';
import 'package:task_7_x3/core/style/appcolor.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    return Container(
      width: double.infinity,
      height: size.height * 0.06,
      decoration: BoxDecoration(
        color: AppColors.onboardingButtonBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.onboardingButtonText,
                fontSize: isMobile ? size.width * 0.04 : size.width * 0.032,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
