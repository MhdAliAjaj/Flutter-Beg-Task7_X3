import 'package:flutter/material.dart';

class OnboardingModel {
  final String title;
  final String? subtitle;
  final String buttonText;
  final Color textColor;
  final int progressIndex;

  OnboardingModel({
    required this.title,
    this.subtitle,
    required this.buttonText,
    required this.textColor,
    required this.progressIndex,
  });
}