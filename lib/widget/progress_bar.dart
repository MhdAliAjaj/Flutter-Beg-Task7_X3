import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final List<Color> bars;
  const ProgressBar({super.key, required this.bars});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: bars.map((color) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 30,
          height: 6,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }).toList(),
    );
  }
}