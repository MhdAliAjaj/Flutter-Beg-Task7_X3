import 'package:flutter/material.dart';
import 'package:task_7_x3/core/style/app_color.dart';
import 'package:task_7_x3/widget/custom_button_onboarding.dart';
import 'package:task_7_x3/widget/progress_bar.dart';

class Onboard3 extends StatelessWidget {
  final VoidCallback onFinish;
  const Onboard3({super.key, required this.onFinish});

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned(
          top: s.height * (108 / 812),
          left: s.width * (52 / 375),
          child: Image.asset(
            'assets/images/Misc.png',
            width: s.width * (77 / 375),
            height: s.height * (77 / 812),
          ),
        ),
        Positioned(
          top: s.height * (328 / 812),
          left: s.width * (30 / 375),
          child: SizedBox(
            width: s.width * (315 / 375),
            child: const Text(
              'You Have The\n Power To',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                fontFamily: 'Raleway',
                color: AppColor.textPrimary,
              ),
            ),
          ),
        ),
        Positioned(
          top: s.height * (448 / 812),
          left: s.width * (26 / 375),
          child: SizedBox(
            width: s.width * (322 / 375),
            child: const Text(
              'There Are Many Beautiful And Attractive\n Plants To Your Room',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                height: 1.5,
                color: AppColor.textSecondary,
              ),
            ),
          ),
        ),
        Positioned(
          top: s.height * (571 / 812),
          left: s.width * (132 / 375),
          child: ProgressBar(
            bars: const [
              AppColor.progressWhite,
              AppColor.progressWhite,
              AppColor.progressGreen,
            ],
          ),
        ),
        Positioned(
          top: s.height * (726 / 812),
          left: s.width * (30 / 375),
          child: SizedBox(
            width: s.width * (315 / 375),
            height: s.height * (50 / 812),
            child: CustomButton(text: 'Next', onPressed: onFinish),
          ),
        ),
      ],
    );
  }
}
