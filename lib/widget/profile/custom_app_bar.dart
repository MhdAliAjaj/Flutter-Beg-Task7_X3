import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final Color  backgroundColor ;
  final Color titleColor;
  final Color iconColor;
  final double elevation;
  const CustomAppBar({super.key,
    required this.title,
    this.showBackButton=true,
    this.onBackPressed,
    this.actions,
    this.backgroundColor=Colors.white,
    this.iconColor=Colors.black,
    this.titleColor=Colors.black,
    this.elevation=0});
  @override

  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {

    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: titleColor,
          fontSize: 18,
        ),
      ),
      backgroundColor: backgroundColor,
      elevation: elevation,
      leading: showBackButton
      ?IconButton(
          icon: Icon(Icons.arrow_back,color: iconColor,),
        onPressed: onBackPressed??()=>Navigator.pop(context)
      ):null,
      actions: actions,
      centerTitle: true,
    );
  }


}
