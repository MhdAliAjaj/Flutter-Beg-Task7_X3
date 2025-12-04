import 'package:flutter/material.dart';
import 'package:task_7_x3/core/style/app_color.dart';
import 'package:task_7_x3/widget/custom_button_onboarding.dart';
import 'package:task_7_x3/widget/progress_bar.dart';

class Onboard1 extends StatelessWidget {
  final VoidCallback onNext;
  const Onboard1({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned(
          top: s.height * (106 / 812),
          left: s.width * (59 / 375),
          child: Image.asset(
            'assets/images/Highlight.png',
            width: s.width * (27 / 375),
            height: s.height * (30 / 812),
          ),
        ),
        Positioned(
          top: s.height * (165 / 812),
          left: s.width * (259 / 375),
          child: Image.asset(
            'assets/images/Misc.png',
            width: s.width * (45 / 375),
            height: s.height * (45 / 812),
          ),
        ),
        Positioned(
          top: s.height * (419 / 812),
          left: s.width * (114 / 375),
          child: Image.asset(
            'assets/images/Vector.png',
            width: s.width * (134 / 375),
            height: s.height * (18 / 812),
          ),
        ),
        Positioned(
          top: s.height * (546 / 812),
          left: s.width * (242 / 375),
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
          top: s.height * (613 / 812),
          left: s.width * (29 / 375),
          child: Transform.rotate(
            angle: -100.98 * 3.1415926535 / 180,
            child: Image.asset(
              'assets/images/Highlight_10.png',
              width: s.width * (90 / 375),
              height: s.height * (54 / 812),
            ),
          ),
        ),
        Positioned(
          top: s.height * (330 / 812),
          left: s.width * (19 / 375),
          child: SizedBox(
            width: s.width * (336 / 375),
            child: const Text(
              'WELCOME TO\n BYTE BOUTIQUE',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                fontFamily: 'Raleway',
                color: AppColor.textPrimary,
              ),
            ),
          ),
        ),
        Positioned(
          top: s.height * (571 / 812),
          left: s.width * (132 / 375),
          child: ProgressBar(
            bars: const [
              AppColor.progressGreen,
              AppColor.progressWhite,
              AppColor.progressWhite,
            ],
          ),
        ),
        Positioned(
          top: s.height * (726 / 812),
          left: s.width * (20 / 375),
          child: SizedBox(
            width: s.width * (335 / 375),
            height: s.height * (50 / 812),
            child: CustomButton(text: 'Get Started', onPressed: onNext),
          ),
        ),
      ],
    );
  }
}
