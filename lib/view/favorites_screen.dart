import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_7_x3/model/favorite_item_model.dart';
import '../core/theme.dart';
// duplicate relative import removed; using package import above

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    final List<FavoriteItemModel> items = [
      FavoriteItemModel(
        img: "assets/images/shirt_7.png",
        price: 58.7,
        colors: [Color(0xFFCB1D1D), Color(0xFF0B2F8B)],
      ),
      FavoriteItemModel(
        img: "assets/images/shirt_9.png",
        price: 37.8,
        colors: [Color(0xFF1F3267), Color(0xFFCB1D1D)],
      ),
      FavoriteItemModel(
        img: "assets/images/shirt_10.png",
        price: 47.7,
        colors: [Color(0xFF2256B9), Color(0xFFA9CFEB)],
      ),
      FavoriteItemModel(
        img: "assets/images/shirt_11.png",
        price: 57.6,
        colors: [Color(0xFF7DDBDA), Color(0xFF606ACB)],
      ),
    ];

    return Scaffold(
      backgroundColor: AppTheme.bgGrey,

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h * 0.1),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: w * 0.11,
                    height: w * 0.11,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back,
                        size: w * 0.055,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Favourite",
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: w * 0.042,
                        fontWeight: FontWeight.w600,
                      ),
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
                  child: Center(
                    child: SvgPicture.asset('assets/icons/heart_black.svg'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: GridView.builder(
        padding: EdgeInsets.fromLTRB(w * 0.05, h * 0.015, w * 0.05, h * 0.15),
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: w * 0.057,
          mainAxisSpacing: h * 0.053,
          childAspectRatio: (w * 0.42) / (h * 0.27),
        ),
        itemBuilder: (context, i) {
          final item = items[i];
          final colors = item.colors.take(2).toList();

          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(w * 0.037),
            ),
            child: Padding(
              padding: EdgeInsets.all(w * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h * 0.12,
                    child: Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            item.img,
                            height: h * 0.11,
                            fit: BoxFit.contain,
                          ),
                        ),

                        Positioned(
                          left: w * 0.00001,
                          top: w * 0.000001,
                          child: Container(
                            width: w * 0.085,
                            height: w * 0.085,
                            decoration: BoxDecoration(
                              color: AppTheme.bgGrey,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(w * 0.018),
                              child: SvgPicture.asset(
                                'assets/icons/heart_filled.svg',
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: h * 0.01),

                  Text(
                    "BEST SELLER",
                    style: TextStyle(
                      color: AppTheme.primaryGreen,
                      fontSize: w * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: h * 0.004),

                  Text(
                    "Programmer T-shirt",
                    style: TextStyle(fontSize: w * 0.037, color: Colors.black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: h * 0.014),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${item.price}",
                        style: TextStyle(
                          fontSize: w * 0.042,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Row(
                        children: List.generate(
                          colors.length,
                          (index) => Container(
                            margin: EdgeInsets.only(
                              left: index == 0 ? 0 : w * 0.02,
                            ),
                            width: w * 0.038,
                            height: w * 0.038,
                            decoration: BoxDecoration(
                              color: colors[index],
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
