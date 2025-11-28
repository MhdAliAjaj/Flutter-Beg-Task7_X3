import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 900;

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        // Adaptive icon and image sizes
        final vectorSize = isMobile
            ? 12.0
            : isTablet
            ? 16.0
            : 20.0;
        final offerImageWidth =
            maxWidth *
            (isMobile
                ? 0.25
                : isTablet
                ? 0.22
                : 0.20);
        final offerImageHeight = offerImageWidth * 0.42; // 55/131 ratio

        final newIconSize = isMobile
            ? 20.0
            : isTablet
            ? 26.0
            : 32.0;
        final mainImageSize =
            maxWidth *
            (isMobile
                ? 0.22
                : isTablet
                ? 0.20
                : 0.18);

        final padding = isMobile
            ? 8.0
            : isTablet
            ? 12.0
            : 16.0;

        return Card(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        "images/Vector.png",
                        width: vectorSize,
                        height: vectorSize,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(
                              "images/Vector.png",
                              width: vectorSize,
                              height: vectorSize,
                            ),
                            Image.asset(
                              "images/offer.png",
                              width: offerImageWidth,
                              height: offerImageHeight,
                              fit: BoxFit.contain,
                            ),
                            Image.asset(
                              "images/Vector.png",
                              width: vectorSize,
                              height: vectorSize,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "images/new.png",
                        height: newIconSize,
                        width: newIconSize,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: isMobile ? 4 : 8),
                      Image.asset(
                        "images/image.png",
                        height: mainImageSize,
                        width: mainImageSize,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: isMobile ? 4 : 8),
                      Image.asset(
                        "images/Vector.png",
                        width: vectorSize,
                        height: vectorSize,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
