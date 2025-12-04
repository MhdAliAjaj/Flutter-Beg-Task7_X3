import 'package:untitled8/config/config.dart';
import 'package:untitled8/core/network/apiservice.dart';
import 'package:untitled8/model/api_response.dart';
import 'package:untitled8/model/product_model.dart';

class ProductService{
  final ApiService _apiService;
  ProductService({
    ApiService ? apiService
}):_apiService = apiService??ApiService();
  //function for get all products
  Future<ApiResponse<List>> getAllProducts() async {
    final response = await _apiService.get<List<dynamic>>(
      ApiConfig.products,
      fromJson: (data) {
        if (data is List) {
          return data
              .map((item) => Product.fromJson(item))
              .toList();
        }
        return [];
      },
    );

    return response;
  }
  Future<ApiResponse<Product>> getProductById(int id) async {
    final response = await _apiService.get<Product>(
      '${ApiConfig.products}/$id',
      fromJson: (data) => Product.fromJson(data as Map<String, dynamic>),
    );

    return response;
  }
  //function to search
Future<ApiResponse<Map<String,dynamic>>> searchProducts(String query)async{
    final allProductsResponse = await getAllProducts();
    if (!allProductsResponse.success) {
      return ApiResponse.error(allProductsResponse.message ?? 'Failed to search products');
    }
    final products = allProductsResponse.data ?? [];
    final filteredProducts = products.where((product) {
      final titleMatch = product.title.toLowerCase().contains(query.toLowerCase());
      final descMatch = product.description.toLowerCase().contains(query.toLowerCase());
      final categoryMatch = product.category.toLowerCase().contains(query.toLowerCase());

      return titleMatch || descMatch || categoryMatch;
    }).toList();
return ApiResponse.success(filteredProducts as Map<String, dynamic>);
}
  Future<ApiResponse<List>> getProductsByCategory(String category) async {
    final response = await _apiService.get<List<dynamic>>(
      '${ApiConfig.products}/category/$category',
      fromJson: (data) {
        if (data is List) {
          return data
              .map((item) => Product.fromJson(item))
              .toList();
        }
        return [];
      },
    );

    return response;
  }
  Future<ApiResponse<List>> getAllCategories() async {
    final response = await _apiService.get<List<dynamic>>(
      ApiConfig.categories,
      fromJson: (data) {
        if (data is List) {
          return data.cast<String>();
        }
        return [];
      },
    );

    return response;
  }
  Future<ApiResponse<List>> getLimitedProducts(int limit) async {
    final response = await _apiService.get<List<dynamic>>(
      '${ApiConfig.products}?limit=$limit',
      fromJson: (data) {
        if (data is List) {
          return data
              .map((item) => Product.fromJson(item))
              .toList();
        }
        return [];
      },
    );

    return response;
  }

}
