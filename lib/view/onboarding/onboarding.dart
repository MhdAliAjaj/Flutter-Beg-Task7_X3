import 'package:flutter/material.dart';
import 'package:task7/controller/onboarding_controller.dart';
import 'package:task7/core/style/app_color.dart';
import 'package:task7/model/onboarding_model.dart';
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
      textColor: AppColor.white,
      progressIndex: 0,
    ),
    OnboardingModel(
      title: "Let's Start Journey",
      subtitle: "Smart, Gorgeous & Fashionable Collection Explore Now",
      buttonText: "Next",
      textColor: AppColor.accent1,
      progressIndex: 1,
    ),
    OnboardingModel(
      title: "You Have The Power To",
      subtitle: "There Are Many Beautiful And Attractive Plants To Your Room",
      buttonText: "Next",
      textColor: AppColor.accent2,
      progressIndex: 2,
    ),
  ];

  void refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: PageView.builder(
        controller: controller.pageController,
        itemCount: screens.length,
        onPageChanged: (index) => controller.onPageChanged(index, refresh),
        itemBuilder: (context, index) {
          return OnboardingStep(
            data: screens[index],
            onPressed: () => controller.nextPage(refresh),
          );
        },
      ),
    );
  }
}
