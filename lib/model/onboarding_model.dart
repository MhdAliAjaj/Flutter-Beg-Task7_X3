import 'package:flutter/material.dart';

class OnboardingModel {
  final String title;
  final String subtitle;
  final String buttonText;
  final Color textColor;
  final int progressIndex;
  final List<String> decorations;

  OnboardingModel({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.textColor,
    required this.progressIndex,
    required this.decorations,
  });
}
