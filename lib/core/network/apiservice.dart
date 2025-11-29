import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_7_x3/model/productmodel.dart';

class ApiService {
  static const String baseUrl = "https://fakestoreapi.com";

  Future<List<Product>> getProductsByCategoryLimit(
    String category,
    int limit,
  ) async {
    final response = await http.get(
      Uri.parse("$baseUrl/products/category/$category?limit=$limit"),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }

  Future<List<Product>> getProductsByCategory(String category) async {
    final response = await http.get(
      Uri.parse("$baseUrl/products/category/$category"),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
