import 'package:flutter/material.dart';
import 'package:task7/core/style/app_color.dart';
import 'package:task7/view/onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.background
      ),
      home: OnboardingPage(),
    );
  }
}