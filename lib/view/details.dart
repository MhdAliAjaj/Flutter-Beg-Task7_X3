import 'package:flutter/material.dart';
import 'package:task_7_x3/core/style/apptextstyle.dart';
import 'package:task_7_x3/model/productmodel.dart';
import 'package:task_7_x3/view/homepage.dart';
import 'package:task_7_x3/view/search_page.dart';
import 'package:task_7_x3/view/profile_page.dart';
import 'package:task_7_x3/widget/custom_bottom_nav.dart';

class DetailsPage extends StatelessWidget {
  final Product product;
  const DetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width,
        h = MediaQuery.of(context).size.height;
    final isTab = w > 600, pad = isTab ? 16.0 : 12.0;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Center action tapped'))),
        backgroundColor: const Color(0xFF34C759),
        child: const Icon(Icons.lock_outline),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text(
          product.category,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: isTab ? 18 : 16,
          ),
        ),
        centerTitle: true,
        leading: MaterialButton(
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const HomePage()),
          ),
          child: Image.asset("images/Arrow.png", width: 40, height: 40),
        ),
        actions: [
          MaterialButton(
            onPressed: () {},
            child: Image.asset("images/cartpoint.png", width: 40, height: 40),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(pad),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title,
              style: AppTextStyles.heading.copyWith(fontSize: isTab ? 24 : 18),
            ),
            SizedBox(height: pad),
            Text(product.category, style: AppTextStyles.productTitle),
            const SizedBox(height: 8),
            Text(
              "\$${product.price}",
              style: AppTextStyles.heading.copyWith(
                fontSize: isTab ? 22 : 18,
                color: const Color(0xFF34C759),
              ),
            ),
            SizedBox(height: pad),
            Center(
              child: Image.network(
                product.image,
                height: isTab ? h * 0.4 : 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: pad * 0.75),
            Center(
              child: Image.asset("images/Slider.png", height: isTab ? 100 : 77),
            ),
            SizedBox(height: pad),
            Text(
              product.description,
              style: AppTextStyles.productTitle.copyWith(
                fontSize: isTab ? 16 : 14,
                height: 1.5,
              ),
            ),
            SizedBox(height: pad * 0.5),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Full Description"),
                    content: SingleChildScrollView(
                      child: Text(product.description),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Close"),
                      ),
                    ],
                  ),
                ),
                child: const Text(
                  "Read More",
                  style: TextStyle(
                    color: Color(0xFF34C759),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: pad * 1.25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Added to favorites!"),
                      duration: Duration(seconds: 1),
                    ),
                  ),
                  child: Image.asset(
                    "images/Favorite.png",
                    width: isTab ? 60 : 52,
                    height: isTab ? 60 : 52,
                  ),
                ),
                InkWell(
                  onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "${product.title} added to cart!",
                        overflow: TextOverflow.ellipsis,
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  ),
                  child: Image.asset(
                    "images/Add.png",
                    width: isTab ? 250 : 208,
                    height: isTab ? 60 : 50,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: 0,
        onTap: (i) {
          if (i == 0) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
          } else if (i == 2) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const SearchScreen()),
            );
          } else if (i == 4) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const ProfileScreen()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Nav item $i not implemented')),
            );
          }
        },
      ),
    );
  }
}
