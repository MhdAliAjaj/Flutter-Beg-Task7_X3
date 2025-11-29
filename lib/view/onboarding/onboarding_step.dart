import 'package:flutter/material.dart';
import 'package:task_7_x3/model/onboarding_model.dart';
import 'package:task_7_x3/widget/custom_button_onboarding.dart';
import 'package:task_7_x3/core/style/appcolor.dart';
import 'progress_indicator.dart';

class OnboardingStep extends StatelessWidget {
  final OnboardingModel data;
  final VoidCallback onPressed;

  const OnboardingStep({
    super.key,
    required this.data,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    return Container(
      color: AppColors.onboardingBg,
      child: SafeArea(
        child: Column(
          children: [
            // Top spacing
            SizedBox(height: size.height * 0.05),

            // Decorative icons/illustrations area
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.onboardingBg,
                      AppColors.onboardingBg.withOpacity(0.8),
                    ],
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Decorative circles
                    Positioned(
                      top: size.height * 0.05,
                      left: size.width * 0.1,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.onboardingSubtext.withOpacity(0.3),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: size.height * 0.1,
                      right: size.width * 0.1,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.onboardingSubtext.withOpacity(0.3),
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),

                    // Central icon/emoji
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _getEmoji(data.progressIndex),
                          style: TextStyle(fontSize: size.width * 0.15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Content section
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.08,
                  vertical: size.height * 0.02,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          data.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.onboardingText,
                            fontSize: isMobile
                                ? size.width * 0.055
                                : size.width * 0.04,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        if (data.subtitle != null && data.subtitle!.isNotEmpty)
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.015),
                            child: Text(
                              data.subtitle!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.onboardingSubtext,
                                fontSize: isMobile
                                    ? size.width * 0.035
                                    : size.width * 0.028,
                                height: 1.5,
                              ),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      children: [
                        ProgressIndicatorWidget(
                          currentIndex: data.progressIndex,
                        ),
                        SizedBox(height: size.height * 0.02),
                        CustomButton(
                          text: data.buttonText,
                          onPressed: onPressed,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getEmoji(int index) {
    switch (index) {
      case 0:
        return '👋';
      case 1:
        return '🛍️';
      case 2:
        return '✨';
      default:
        return '👋';
    }
  }
}
