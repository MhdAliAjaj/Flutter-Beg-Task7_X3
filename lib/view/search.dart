import 'package:flutter/material.dart';
import 'package:task_7_x3/core/style/apptextstyle.dart';
import 'package:task_7_x3/controller/productcontroller.dart';
import 'package:task_7_x3/model/productmodel.dart';
import 'package:task_7_x3/view/details.dart';
import 'package:task_7_x3/widget/custom_bottom_nav.dart';
import 'package:task_7_x3/widget/productcard.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = ProductController();
  String searchQuery = "";
  List<Product> allProducts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAllProducts();
  }

  Future<void> _loadAllProducts() async {
    try {
      final products = await controller.fetchCategoryAll("electronics");
      setState(() {
        allProducts = products;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMob = w < 600, isTab = w < 900;
    final pad = isMob
        ? 12.0
        : isTab
        ? 16.0
        : 20.0;

    List<Product> filtered = allProducts
        .where(
          (p) =>
              p.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
              p.category.toLowerCase().contains(searchQuery.toLowerCase()),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 249, 244),
        title: const Text("Search"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: pad,
                vertical: isMob ? 8 : 12,
              ),
              child: Container(
                height: isMob
                    ? 48
                    : isTab
                    ? 52
                    : 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search products...",
                    prefixIcon: Icon(Icons.search, size: isMob ? 18 : 20),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onChanged: (v) => setState(() => searchQuery = v),
                ),
              ),
            ),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : filtered.isEmpty
                  ? Center(
                      child: Text(
                        searchQuery.isEmpty
                            ? "Start searching"
                            : "No results found",
                        style: AppTextStyles.tab,
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: w >= 900
                            ? 4
                            : w >= 600
                            ? 3
                            : 2,
                        childAspectRatio: w >= 900
                            ? 0.75
                            : w >= 600
                            ? 0.8
                            : 0.9,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: filtered.length,
                      itemBuilder: (c, i) => GestureDetector(
                        onTap: () => Navigator.push(
                          c,
                          MaterialPageRoute(
                            builder: (_) => DetailsPage(product: filtered[i]),
                          ),
                        ),
                        child: ProductCard(product: filtered[i]),
                      ),
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: 2,
        onTap: (i) => _handleNavTap(i),
      ),
    );
  }

  void _handleNavTap(int i) {
    if (i == 0) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    } else if (i == 4) {
      Navigator.of(context).pushReplacementNamed('/profile');
    }
  }
}
