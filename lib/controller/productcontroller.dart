import 'package:task_7_x3/core/network/apiservice.dart';
import 'package:task_7_x3/model/productmodel.dart';

class ProductController {
  final ApiService _apiService = ApiService();

  Future<List<Product>> fetchCategoryTwo(String category) async {
    final resp = await _apiService.get<List<dynamic>>(
      '/products/category/$category?limit=2',
      fromJson: (data) {
        if (data is List) return data.map((e) => Product.fromJson(e)).toList();
        return <Product>[];
      },
    );
    return (resp.data as List<Product>?) ?? <Product>[];
  }

  Future<List<Product>> fetchCategoryAll(String category) async {
    final resp = await _apiService.get<List<dynamic>>(
      '/products/category/$category',
      fromJson: (data) {
        if (data is List) return data.map((e) => Product.fromJson(e)).toList();
        return <Product>[];
      },
    );
    return (resp.data as List<Product>?) ?? <Product>[];
  }
}
