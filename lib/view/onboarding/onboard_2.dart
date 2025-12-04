import 'package:flutter/material.dart';
import 'package:task_7_x3/core/style/app_color.dart';
import 'package:task_7_x3/widget/custom_button_onboarding.dart';
import 'package:task_7_x3/widget/progress_bar.dart';

class Onboard2 extends StatelessWidget {
  final VoidCallback onNext;
  const Onboard2({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned(
          top: s.height * (113 / 812),
          left: s.width * (304 / 375),
          child: Opacity(
            opacity: 0.7,
            child: Image.asset(
              'assets/images/Misc.png',
              width: s.width * (45 / 375),
              height: s.height * (45 / 812),
            ),
          ),
        ),
        Positioned(
          top: s.height * (116 / 812),
          left: s.width * (27 / 375),
          child: Transform.rotate(
            angle: -10.98 * 3.1415926535 / 180,
            child: Image.asset(
              'assets/images/Highlight_10.png',
              width: s.width * (90 / 375),
              height: s.height * (54 / 812),
            ),
          ),
        ),
        Positioned(
          top: s.height * (328 / 812),
          left: s.width * (30 / 375),
          child: SizedBox(
            width: s.width * (315 / 375),
            child: const Text(
              "Let's Start Journey",
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
              'Smart, Gorgeous & Fashionable\n Collection Explore Now',
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
              AppColor.progressGreen,
              AppColor.progressWhite,
            ],
          ),
        ),
        Positioned(
          top: s.height * (726 / 812),
          left: s.width * (30 / 375),
          child: SizedBox(
            width: s.width * (315 / 375),
            height: s.height * (50 / 812),
            child: CustomButton(text: 'Next', onPressed: onNext),
          ),
        ),
      ],
    );
  }
}
