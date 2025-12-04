import 'package:task_7_x3/config/config.dart';
import 'package:task_7_x3/core/network/apiservice.dart';
import 'package:task_7_x3/model/api_response.dart';
import 'package:task_7_x3/model/productmodel.dart';

class ProductService {
  final ApiService _apiService;

  ProductService({ApiService? apiService})
    : _apiService = apiService ?? ApiService();

  // Get all products
  Future<ApiResponse<List<Product>>> getAllProducts() async {
    final resp = await _apiService.get<List<Product>>(
      ApiConfig.products,
      fromJson: (data) {
        if (data is List) {
          return data.map((e) => Product.fromJson(e)).toList();
        }
        return <Product>[];
      },
    );
    return resp;
  }

  Future<ApiResponse<Product>> getProductById(int id) async {
    final resp = await _apiService.get<Product>(
      '${ApiConfig.products}/$id',
      fromJson: (data) => Product.fromJson(data as Map<String, dynamic>),
    );
    return resp;
  }

  // Search products by querying the cached list
  Future<ApiResponse<List<Product>>> searchProducts(String query) async {
    final allResp = await getAllProducts();
    if (!allResp.success)
      return ApiResponse.error(allResp.message ?? 'Search failed');
    final products = allResp.data ?? [];
    final q = query.toLowerCase();
    final filtered = products.where((product) {
      return product.title.toLowerCase().contains(q) ||
          product.description.toLowerCase().contains(q) ||
          product.category.toLowerCase().contains(q);
    }).toList();
    return ApiResponse.success(filtered);
  }

  Future<ApiResponse<List<Product>>> getProductsByCategory(
    String category,
  ) async {
    final resp = await _apiService.get<List<Product>>(
      '${ApiConfig.products}/category/$category',
      fromJson: (data) {
        if (data is List) return data.map((e) => Product.fromJson(e)).toList();
        return <Product>[];
      },
    );
    return resp;
  }

  Future<ApiResponse<List<String>>> getAllCategories() async {
    final resp = await _apiService.get<List<String>>(
      ApiConfig.categories,
      fromJson: (data) {
        if (data is List) return data.cast<String>();
        return <String>[];
      },
    );
    return resp;
  }

  Future<ApiResponse<List<Product>>> getLimitedProducts(int limit) async {
    final resp = await _apiService.get<List<Product>>(
      '${ApiConfig.products}?limit=$limit',
      fromJson: (data) {
        if (data is List) return data.map((e) => Product.fromJson(e)).toList();
        return <Product>[];
      },
    );
    return resp;
  }
}
