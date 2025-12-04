import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenuPage extends StatelessWidget {
  const SideMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),

      body: SafeArea(
        child: SingleChildScrollView(   
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: w * 0.07,
              vertical: h * 0.03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: w * 0.26,
                        height: w * 0.26,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/images/profile_prog.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: h * 0.018),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Programmer X",
                        style: TextStyle(
                          fontFamily: "Raleway",
                          color: Colors.white,
                          fontSize: w * 0.053,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: h * 0.05),

                menuTile(icon: "assets/icons/profile.svg", title: "Profile", w: w),
                menuTile(icon: "assets/icons/bag-2.svg", title: "My Cart", w: w),
                menuTile(icon: "assets/icons/heart.svg", title: "Favorite", w: w),
                menuTile(icon: "assets/icons/orders.svg", title: "Orders", w: w),
                menuTile(icon: "assets/icons/notification.svg", title: "Notifications", w: w),
                menuTile(icon: "assets/icons/settings.svg", title: "Settings", w: w),

                SizedBox(height: h * 0.04),

                Divider(color: Colors.white54, thickness: 2),

                SizedBox(height: h * 0.03),

                menuTile(
                  icon: "assets/icons/logout.svg",
                  title: "Sign Out",
                  w: w,
                  isLogout: true,
                ),

                SizedBox(height: h * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget menuTile({
    required String icon,
    required String title,
    required double w,
    bool isLogout = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: w * 0.038),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            color: Colors.white,
            width: w * 0.065,
          ),
          SizedBox(width: w * 0.04),

          Text(
            title,
            style: TextStyle(
              fontFamily: "Raleway",
              color: Colors.white,
              fontSize: w * 0.045,
            ),
          ),

          const Spacer(),

          if (!isLogout)
            Icon(Icons.arrow_forward_ios, color: Colors.white, size: w * 0.04),
        ],
      ),
    );
  }
}
