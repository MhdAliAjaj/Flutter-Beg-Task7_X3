import 'package:task6/core/network/apiservice.dart';
import 'package:task6/model/productmodel.dart';

class ProductController {
  final ApiService _apiService = ApiService();

  Future<List<Product>> fetchCategoryTwo(String category) {
    return _apiService.getProductsByCategoryLimit(category, 2);
  }

  Future<List<Product>> fetchCategoryAll(String category) {
    return _apiService.getProductsByCategory(category);
  }
}
