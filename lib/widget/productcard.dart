import 'package:flutter/material.dart';
import 'package:task_7_x3/core/style/appcolor.dart';
import 'package:task_7_x3/core/style/apptextstyle.dart';
import 'package:task_7_x3/model/productmodel.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final isDesktop = screenWidth > 900;

    final titleSize = isDesktop
        ? 16.0
        : isTablet
        ? 14.0
        : 12.0;
    final priceSize = isDesktop
        ? 15.0
        : isTablet
        ? 14.0
        : 13.0;
    final iconSize = isDesktop
        ? 24.0
        : isTablet
        ? 20.0
        : 15.0;

    return SizedBox(
      height: 200, // 🔥 ارتفاع الكارد (مهم لحساب 40%)
      child: Card(
        color: Colors.white,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final imageHeight =
                constraints.maxHeight * 0.40; // 40% من ارتفاع الكارد

            return Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        bottom: 12,
                        left: 38,
                        right: 26,
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.network(
                          product.image,
                          height: imageHeight,
                          fit: BoxFit.contain, // الصورة كاملة بدون تشوّه
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Best Seller",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF34C759),
                            ),
                          ),
                          Text(
                            product.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.productTitle.copyWith(
                              fontSize: titleSize,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "\$${product.price.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: priceSize,
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // ❤️ Heart Icon
                Positioned(
                  top: 15,
                  left: 14,
                  child: Image.asset(
                    "images/heart.png",
                    width: iconSize,
                    height: iconSize,
                  ),
                ),

                // ➕ Button Icon
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    "images/button.png",
                    width: iconSize + 20,
                    height: iconSize + 20,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
