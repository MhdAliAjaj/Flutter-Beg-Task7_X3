import 'package:flutter/material.dart';
import 'package:shop_app/core/theme.dart';

class CartItemWhite extends StatelessWidget {
  final String image;
  final String title;
  final double price;

  const CartItemWhite({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(bottom: h * 0.02),
      child: Container(
        padding: EdgeInsets.all(w * 0.035),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(w * 0.021),
        ),
        child: Row(
          children: [
            Container(
              width: w * 0.23,
              height: h* 0.10,
              decoration: BoxDecoration(
                color:AppTheme.bgGrey,
                borderRadius: BorderRadius.circular(w * 0.03),
              ),
              padding: EdgeInsets.all(w * 0.02),
              child: Image.asset(image,),
            ),
            SizedBox(width: w * 0.08),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontFamily: "Raleway",
                      fontSize: w * 0.034,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: h * 0.008),
                  Text(
                    "\$${price.toStringAsFixed(2)}",
                    style: TextStyle(fontFamily: "Poppins",
                      fontSize: w * 0.037,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
