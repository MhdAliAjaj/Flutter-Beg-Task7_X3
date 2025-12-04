import 'package:flutter/material.dart';
import 'package:task_7_x3/core/style/app_color.dart';
import 'package:task_7_x3/widget/profile/custom_app_bar.dart';
import 'package:task_7_x3/widget/search/product_results_list.dart';
import 'package:task_7_x3/widget/search/search_field.dart';
import 'package:task_7_x3/core/network/product_service.dart';
import 'package:task_7_x3/model/productmodel.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  final ProductService _productService = ProductService();

  List<Product> searchResults = [];
  List<String> suggestions = [];

  bool isLoading = false;
  bool noResults = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: "Search",
              actions: [
                TextButton(
                  //add function for onPressed cancel default
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: AppColor.primary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            SearchField(controller: _controller, onChanged: _onSearchChanged),
            const SizedBox(height: 20),
            Expanded(child: _buildBody()),
          ],
        ),
      ),
    );
  }

  void _onSearchChanged(String value) async {
    if (value.isEmpty) {
      setState(() {
        suggestions.clear();
        searchResults.clear();
        noResults = false;
      });
      return;
    }

    setState(() => isLoading = true);
    final result = await _productService.searchProducts(value);

    setState(() {
      isLoading = false;
      if (result.success) {
        searchResults = result.data ?? [];
        noResults = searchResults.isEmpty;
      } else {
        searchResults.clear();
        noResults = true;
      }
    });
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (noResults) {
      return const Center(
        child: Text("No products found", style: TextStyle(fontSize: 16)),
      );
    }

    if (_controller.text.isEmpty) {
      return _buildSuggestionList("Shirt", suggestions);
    }

    if (searchResults.isEmpty) {
      return _buildSuggestionList("Suggestions", suggestions);
    }

    return ProductResultsList(products: searchResults);
  }

  Widget _buildSuggestionList(String title, List<String> list) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 15),
        ...list.map(
          (item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                const Icon(Icons.history, size: 20),
                const SizedBox(width: 10),
                Text(item, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
