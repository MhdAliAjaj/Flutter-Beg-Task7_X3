import 'package:flutter/material.dart';
import 'package:task_7_x3/core/style/appcolor.dart';
import 'package:task_7_x3/view/onboarding/onboarding_page.dart';
// unused imports removed
import 'core/utils/shared_preference.dart';

void main() async {
  runApp(const MyApp());
  await SharedPrefs.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // no-op initialization removed (not used during MaterialApp build)
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
