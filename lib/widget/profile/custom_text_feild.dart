import 'package:flutter/material.dart';
import 'package:task_7_x3/core/style/app_color.dart';

class CustomTextFeild extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool enable;
  final TextInputType keyboardType;
  final IconData prefixIcon;

  const CustomTextFeild({
    super.key,
    required this.controller,
    required this.hintText,
    this.enable = true,
    this.keyboardType = TextInputType.text,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: AppColor.fieldBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.borderLight, width: 1),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 12),
            child: Icon(prefixIcon, color: AppColor.textHint, size: 24),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              enabled: enable,
              keyboardType: keyboardType,
              style: TextStyle(
                color: AppColor.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: AppColor.textHint,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
