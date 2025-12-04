import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widget/notification_item.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F7),

      /* ---------------------- AppBar ---------------------- */
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h * 0.1),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05),
            child: Row(
              children: [
                Container(
                  width: w * 0.11,
                  height: w * 0.11,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(Icons.arrow_back, size: w * 0.055),
                ),

                Expanded(
                  child: Center(
                    child: Text(
                      "Notifications",
                      style: TextStyle( fontFamily: 'Raleway',fontSize: w * 0.045, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),

                Container(
                  width: w * 0.12,
                  height: w * 0.12,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(child: SvgPicture.asset('images/icons/basket.svg', color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.05),
        child: ListView(
          children: [
            SizedBox(height: h * 0.019),

            Text(
              "Recent",
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: w * 0.048,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: h * 0.019),
            NotificationItem(
              w: w,
              h: h,
              image: "images/shirt_9.png",
              title: "Thank you for purchasing",
              subtitle: "Your order will be shipped in 2–4 days",
              time: "7 min ago",
              highlighted: true,
            ),
            NotificationItem(
              w: w,
              h: h,
              image: "images/shirt_7.png",
              title: "We Have New Products With Offers",
              subtitle: "\$364.95       \$260.00",
              time: "40 min ago",
            ),

            SizedBox(height: h * 0.025),
            Text(
              "Yesterday",
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: w * 0.048,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: h * 0.015),

            NotificationItem(
              w: w,
              h: h,
              image: "images/shirt_7.png",
              title: "We Have New Products With Offers",
              subtitle: "\$364.95       \$260.00",
              time: "40 min ago",
            ),

            NotificationItem(
              w: w,
              h: h,
              image: "images/shirt_11.png",
              title: "We Have New Products With Offers",
              subtitle: "\$364.95       \$260.00",
              time: "40 min ago",
            ),

            SizedBox(height: h * 0.04),
          ],
        ),
      ),
    );
  }
}
