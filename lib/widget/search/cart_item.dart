import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;

  const CartItemCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(bottom: h * 0.02),
      padding: EdgeInsets.all(w * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(w * 0.04),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: [
          /// الصورة
          Container(
            width: w * 0.18,
            height: w * 0.18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(w * 0.03),
              color: Colors.grey[100],
            ),
            padding: EdgeInsets.all(w * 0.02),
            child: Image.asset(image, fit: BoxFit.contain),
          ),

          SizedBox(width: w * 0.04),

          /// الاسم + السعر
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600)),
                SizedBox(height: h * 0.005),
                Text(price,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          /// زر الحذف (UI فقط)
          Container(
            width: w * 0.12,
            height: w * 0.12,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(w * 0.03),
            ),
            child: const Icon(Icons.delete, color: Colors.white, size: 28),
          ),
        ],
      ),
    );
  }
}
