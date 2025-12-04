import '../../config/config.dart';
import '../../model/api_response.dart';
import '../../model/user_model.dart';
import 'apiservice.dart';

class UserService {
  final ApiService _apiService;

  UserService({ApiService? apiService})
      : _apiService = apiService ?? ApiService();
  Future<ApiResponse<User>> getUserProfile(int userId, {String? token}) async {
    Map<String, String>? headers;
    if (token != null && token.isNotEmpty) {
      headers = _apiService.getHeadersWithToken(token);
    }
    final response = await _apiService.get<Map<String, dynamic>>(
      '${ApiConfig.users}/$userId',
      headers: headers,
    );
    return _handleUserResponse(response);
  }
  Future<ApiResponse<User>> updateProfile({
    required int userId,
    required String token,
    String? email,
    String? username,
    String? firstName,
    String?password,
    String?imageUrl,

  }) async {
    final headers = _apiService.getHeadersWithToken(token);
    final body = {
      if (email != null) 'email': email,
      if (username != null) 'username': username,
        'name': {
          'firstname': firstName ?? '',
        },
    };
    final response = await _apiService.put<Map<String, dynamic>>(
      '${ApiConfig.users}/$userId',
      headers: headers,
      body: body,
    );
    return _handleUserResponse(response);
  }
  Future<ApiResponse<User>> getCurrentUser({String? token}) async {
    return await getUserProfile(1, token: token);
  }
  ApiResponse<User> _handleUserResponse(ApiResponse<Map<String, dynamic>> response) {
    if (response.success && response.data != null) {
      try {
        final user = User.fromJson(response.data!);
        return ApiResponse.success(
          user,
          message: response.message,
          statusCode: response.statusCode,
        );
      } catch (e) {
        return ApiResponse.error(
          'Failed to parse user data: $e',
          statusCode: response.statusCode,
        );
      }
    } else {
      return ApiResponse.error(
        response.message ?? 'Request failed',
        statusCode: response.statusCode,
      );
    }
  }
}