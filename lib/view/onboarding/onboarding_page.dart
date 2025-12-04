import 'package:flutter/material.dart';
import 'package:task_7_x3/controller/onboarding_controller.dart';
import 'package:task_7_x3/core/service/shared_preferences.dart';
import 'package:task_7_x3/core/style/app_color.dart';
import 'package:task_7_x3/view/auth/login_page.dart';
import 'package:task_7_x3/view/onboarding/onboard_1.dart';
import 'package:task_7_x3/view/onboarding/onboard_2.dart';
import 'package:task_7_x3/view/onboarding/onboard_3.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = OnboardingController();

  void refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: PageView(
        controller: controller.pageController,
        onPageChanged: (i) => controller.onChanged(i, refresh),
        children: [
          Onboard1(onNext: () => controller.next(refresh)),
          Onboard2(onNext: () => controller.next(refresh)),
          Onboard3(
            onFinish: () async {
              await PrefService.setOnboardingSeen(true);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
