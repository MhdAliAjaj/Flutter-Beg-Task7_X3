import 'package:flutter/material.dart';
import 'package:task_7_x3/controller/productcontroller.dart';
import 'package:task_7_x3/core/style/apptextstyle.dart';
import 'package:task_7_x3/model/productmodel.dart';
import 'package:task_7_x3/view/details.dart';
import 'package:task_7_x3/widget/offercard.dart';
import 'package:task_7_x3/widget/productcard.dart';
import 'package:task_7_x3/widget/custom_bottom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ProductController();
  String searchQuery = "";
  int selectedTab = 0;
  int navIndex = 0;
  bool showAll = false;
  final tabs = ["men's clothing", "women's clothing", "jewelery"];

  void _onNavTap(int idx) {
    if (idx == 0) {
      setState(() => navIndex = 0);
    } else if (idx == 2) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Center action tapped')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nav item $idx not implemented yet')),
      );
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
    final icon = isMob
        ? 18.0
        : isTab
        ? 26.0
        : 35.0;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onNavTap(2),
        backgroundColor: const Color(0xFF34C759),
        child: const Icon(Icons.lock_outline),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 249, 244),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/Highlight.png",
              height: icon * 0.95,
              width: icon * 0.95,
            ),
            SizedBox(width: isMob ? 6 : 8),
            Text(
              "Explore",
              style: AppTextStyles.heading.copyWith(
                fontSize: isMob
                    ? 28
                    : isTab
                    ? 32
                    : 36,
              ),
            ),
          ],
        ),
        centerTitle: true,
        leading: MaterialButton(
          onPressed: () {},
          child: Image.asset(
            "images/Hamburger.png",
            height: icon,
            width: icon * 1.3,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: pad),
            child: InkWell(
              onTap: () {},
              child: Image.asset(
                "images/cartpoint.png",
                height: icon,
                width: icon,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: pad,
                  vertical: isMob ? 8 : 12,
                ),
                child: Row(
                  children: [
                    Expanded(
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
                            hintText: "Looking for ......",
                            prefixIcon: Icon(
                              Icons.search,
                              size: isMob ? 18 : 20,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                          ),
                          onChanged: (v) => setState(() => searchQuery = v),
                        ),
                      ),
                    ),
                    SizedBox(width: pad * 0.5),
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        width: isMob ? 48 : 50,
                        height: isMob
                            ? 48
                            : isTab
                            ? 52
                            : 56,
                        child: Image.asset(
                          "images/circleslider.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: pad),
                child: Text(
                  "Select Category",
                  style: AppTextStyles.tab.copyWith(fontSize: isMob ? 14 : 16),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: pad * 0.5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(tabs.length, (i) {
                      final sel = selectedTab == i;
                      return GestureDetector(
                        onTap: () => setState(() {
                          selectedTab = i;
                          showAll = false;
                        }),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: isMob ? 4 : 6,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: isMob ? 6 : 8,
                            horizontal: isMob ? 12 : 16,
                          ),
                          height: isMob ? 36 : 40,
                          decoration: BoxDecoration(
                            color: sel ? const Color(0xFF34C759) : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              tabs[i],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: sel ? Colors.white : Colors.black,
                                fontSize: isMob ? 12 : 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: 18),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: pad),
                child: Row(
                  children: [
                    Text(
                      "Popular T-shirt",
                      style: AppTextStyles.tab.copyWith(
                        fontSize: isMob ? 14 : 16,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () => setState(() => showAll = !showAll),
                      child: Text(
                        showAll ? "Show less" : "See all",
                        style: const TextStyle(
                          color: Color(0xFF34C759),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder<List<Product>>(
                future: showAll
                    ? controller.fetchCategoryAll(tabs[selectedTab])
                    : controller.fetchCategoryTwo(tabs[selectedTab]),
                builder: (c, s) {
                  if (s.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (s.hasError) {
                    return Center(child: Text("Error: ${s.error}"));
                  }
                  var prods = s.data ?? [];
                  if (searchQuery.isNotEmpty) {
                    prods = prods
                        .where(
                          (p) => p.title.toLowerCase().contains(
                            searchQuery.toLowerCase(),
                          ),
                        )
                        .toList();
                  }
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(20),
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
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: prods.length,
                    itemBuilder: (c, i) => GestureDetector(
                      onTap: () => Navigator.push(
                        c,
                        MaterialPageRoute(
                          builder: (_) => DetailsPage(product: prods[i]),
                        ),
                      ),
                      child: ProductCard(product: prods[i]),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: pad),
                child: Row(
                  children: [
                    Text(
                      "New Arrivals",
                      style: AppTextStyles.tab.copyWith(
                        fontSize: isMob ? 14 : 16,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "See all",
                        style: TextStyle(
                          color: Color(0xFF34C759),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: pad,
                  vertical: isMob ? 8 : 12,
                ),
                child: OfferCard(),
              ),
              SizedBox(height: pad * 1.5),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: navIndex,
        onTap: (i) => _onNavTap(i),
      ),
    );
  }
}
