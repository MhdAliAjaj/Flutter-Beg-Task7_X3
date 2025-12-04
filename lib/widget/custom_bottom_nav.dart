import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const CustomBottomNav({Key? key, this.currentIndex = 0, this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      elevation: 10,
      child: Container(
        height: 68,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.home,
                    color: currentIndex == 0
                        ? const Color(0xFF34C759)
                        : Colors.grey,
                  ),
                  onPressed: () => onTap?.call(0),
                ),
                const SizedBox(width: 6),
                IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: currentIndex == 1
                        ? const Color(0xFF34C759)
                        : Colors.grey,
                  ),
                  onPressed: () => onTap?.call(1),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.notifications_none,
                    color: currentIndex == 3
                        ? const Color(0xFF34C759)
                        : Colors.grey,
                  ),
                  onPressed: () => onTap?.call(3),
                ),
                const SizedBox(width: 6),
                IconButton(
                  icon: Icon(
                    Icons.person_outline,
                    color: currentIndex == 4
                        ? const Color(0xFF34C759)
                        : Colors.grey,
                  ),
                  onPressed: () => onTap?.call(4),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
