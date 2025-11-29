import 'package:flutter/material.dart';
import 'package:task_7_x3/core/style/appcolor.dart';
import 'package:task_7_x3/view/onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: AppBarTheme(backgroundColor: AppColors.background),
      ),
      home: const OnboardingPage(),
    );
  }
}
