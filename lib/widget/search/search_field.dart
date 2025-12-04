import 'package:flutter/material.dart';

import '../../core/style/app_color.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String hint;
  const SearchField({super.key,
    required this.controller,
    this.onChanged,
     this.hint="search your shirt"});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color:  AppColor.fieldBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: Container(
            margin: const EdgeInsets.only(right: 5),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColor.fieldBackground,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.mic,
              size: 20,
            ),
          ),

          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
