import 'package:flutter/material.dart';
import 'package:task_7_x3/core/style/appcolor.dart';
import 'package:task_7_x3/view/onboarding/onboarding.dart';
import 'package:task_7_x3/view/profile_page.dart';
import 'package:task_7_x3/view/search_page.dart';
import 'controller/user_controller.dart';
import 'core/network/apiservice.dart';
import 'core/network/user_service.dart';
import 'core/utils/shared_preference.dart';

void main() async {
  runApp(const MyApp());
  await SharedPrefs.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();
    final sharedPrefs = SharedPrefs();
    final userService = UserService(apiService: apiService);
    final userController = UserController(
      userService: userService,
      sharedPrefs: sharedPrefs,
    );
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
