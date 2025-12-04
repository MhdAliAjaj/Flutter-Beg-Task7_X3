class ApiConfig{
  static const String baseUrl = "https://fakestoreapi.com";
  //end points for
  static const String products = '/products';
  static const String productDetails = '/products';
  static const String categories = '/products/categories';
  //Users Endpoints
static const String users = '/users';
static const String userProfile = '/users';
//Timeout Setting
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  //Headers
static const Map<String,String> defaultHeaders ={
  'Content-Type': 'application/json',
  'Accept': 'application/json',
};
//Helper methods to build URLs
static String getProductDetailUrl(int id)=>'$baseUrl$productDetails/$id';
static String getUserProfileUrl(int id)=>'$baseUrl$userProfile/$id';
static String getCategoryProductsUrl(String category)=>'$baseUrl$productDetails/category/$category';
}