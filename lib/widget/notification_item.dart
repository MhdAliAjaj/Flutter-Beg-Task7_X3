import 'package:flutter/material.dart';
import 'package:shop_app/core/theme.dart';

class NotificationItem extends StatelessWidget {
  final double w, h;
  final String image, title, subtitle, time;
  final bool highlighted;

  const NotificationItem({
    super.key,
    required this.w,
    required this.h,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.time,
    this.highlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w*0.95 ,
      height: h*0.13,
      margin: EdgeInsets.only(bottom: h * 0.015),
      padding: EdgeInsets.all(w * 0.03),
      decoration: BoxDecoration(
        color: highlighted ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(w * 0.021),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
       // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
             width: w * 0.20,
            height: h* 0.11,
            decoration: BoxDecoration(
             color: highlighted ? AppTheme.bgGrey : Colors.white,
              borderRadius: BorderRadius.circular(w * 0.042),
             ),
            
              padding: EdgeInsets.all(w*0.02),
              child: Image.asset(image, fit: BoxFit.contain),
          ),

          SizedBox(width: w * 0.04),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: w * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: h * 0.005),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Color(0xff707B81),
                    fontFamily: 'Poppins',
                    fontSize: w * 0.03,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: w * 0.01),
            child: Text(
              time,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: w * 0.037,
                fontWeight: FontWeight.w500,
                color: Color(0xff707B81),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
