import 'package:flutter/material.dart';
import 'package:task7/model/onboarding_model.dart';
import 'package:task7/widget/custom_button_onboarding.dart';
import 'progress_indicator.dart';

class OnboardingStep extends StatelessWidget {
  final OnboardingModel data;
  final VoidCallback onPressed;

  const OnboardingStep({super.key, required this.data, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.08,
        vertical: size.height * 0.1,
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
                  color: data.textColor,
                  fontSize: size.width * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (data.subtitle != null)
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.02),
                  child: Text(
                    data.subtitle!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: data.textColor.withOpacity(0.8),
                      fontSize: size.width * 0.045,
                    ),
                  ),
                ),
              SizedBox(height: size.height * 0.04),
              ProgressIndicatorWidget(currentIndex: data.progressIndex),
            ],
          ),
          CustomButton(text: data.buttonText, onPressed: onPressed),
        ],
      ),
    );
  }
}
