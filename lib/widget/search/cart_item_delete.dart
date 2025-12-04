import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartItemDelete extends StatelessWidget {
  final String image;
  final String title;
  final double price;

  const CartItemDelete({
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
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: w * 0.23,
              height: h* 0.12, 
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
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(w * 0.03),
                    ),
                    padding: EdgeInsets.all(w * 0.02),
                    child: Image.asset(image,),
                  ),
                  SizedBox(width: w * 0.07),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: w * 0.034,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: h * 0.008),
                        Text(
                          "\$${price.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontFamily: "Poppins",
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
          ),

          SizedBox(width: w * 0.02),
          Container(
           width: w * 0.15,
            height: h* 0.12,
            padding: EdgeInsets.symmetric(vertical: h * 0.03),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(w * 0.021),
            ),
            child: Center(
              child: SvgPicture.asset( 'assets/icons/basket.svg',
                                    width: w * 0.045,
                                    height: w * 0.045,
                                    fit: BoxFit.contain,
                                   color: Colors.white, 
                                //   size: w * 0.07
                                   ),
            ),
          ),
        ],
      ),
    );
  }
}
