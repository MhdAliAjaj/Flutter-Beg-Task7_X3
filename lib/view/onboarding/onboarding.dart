import 'package:flutter/material.dart';
import 'package:task_7_x3/controller/onboarding_controller.dart';
import 'package:task_7_x3/core/style/appcolor.dart';
import 'package:task_7_x3/model/onboarding_model.dart';
import 'package:task_7_x3/view/homepage.dart';
import 'onboarding_step.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = OnboardingController();

  final List<OnboardingModel> screens = [
    OnboardingModel(
      title: "WELCOME TO BYTE BOUTIQUE",
      buttonText: "Get Started",
      textColor: AppColors.onboardingText,
      progressIndex: 0,
    ),
    OnboardingModel(
      title: "Let's Start Journey",
      subtitle: "Smart, Gorgeous & Fashionable Collection Explore Now",
      buttonText: "Next",
      textColor: AppColors.onboardingText,
      progressIndex: 1,
    ),
    OnboardingModel(
      title: "You Have The Power To",
      subtitle: "There Are Many Beautiful And Attractive Plants To Your Room",
      buttonText: "Next",
      textColor: AppColors.onboardingText,
      progressIndex: 2,
    ),
  ];

  void refresh() => setState(() {});

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onboardingBg,
      body: PageView.builder(
        controller: controller.pageController,
        itemCount: screens.length,
        onPageChanged: (index) => controller.onPageChanged(index, refresh),
        itemBuilder: (context, index) {
          return OnboardingStep(
            data: screens[index],
            onPressed: () {
              if (controller.currentPage < 2) {
                controller.nextPage(refresh);
              } else {
                _navigateToHome();
              }
            },
          );
        },
      ),
    );
  }
}
