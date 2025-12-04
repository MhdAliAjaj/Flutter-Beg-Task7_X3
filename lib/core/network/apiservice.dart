import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config/config.dart';
import '../../model/api_response.dart';

class ApiService {
  final String baseUrl;
  final Map<String, String> defaultHeaders;

  ApiService({String? baseUrl, Map<String, String>? headers})
    : baseUrl = baseUrl ?? ApiConfig.baseUrl,
      defaultHeaders = headers ?? ApiConfig.defaultHeaders;

  // Helper method to handle HTTP requests
  Future<ApiResponse<T>> _handleRequest<T>(
    Future<http.Response> request,
    T Function(dynamic) fromJson,
  ) async {
    try {
      final response = await request.timeout(ApiConfig.receiveTimeout);

      final data = json.decode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return ApiResponse.success(
          fromJson(data),
          message: 'Success',
          statusCode: response.statusCode,
        );
      } else {
        return ApiResponse.error(
          data['message'] ??
              'Request failed with status ${response.statusCode}',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return ApiResponse.error(e.toString(), statusCode: 500);
    }
  }

  // GET request
  Future<ApiResponse<T>> get<T>(
    String endpoint, {
    Map<String, String>? headers,
    T Function(dynamic)? fromJson,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');

    final mergedHeaders = {...defaultHeaders, ...?headers};

    return _handleRequest<T>(
      http.get(url, headers: mergedHeaders),
      fromJson ?? (data) => data,
    );
  }

  //post request for login
  Future<ApiResponse<T>> post<T>(
    String endpoint, {
    dynamic body,
    Map<String, String>? headers,
    T Function(dynamic)? fromJson,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');

    final mergedHeaders = {...defaultHeaders, ...?headers};

    return _handleRequest<T>(
      http.post(url, headers: mergedHeaders, body: json.encode(body)),
      fromJson ?? (data) => data,
    );
  }

  // PUT request
  Future<ApiResponse<T>> put<T>(
    String endpoint, {
    dynamic body,
    Map<String, String>? headers,
    T Function(dynamic)? fromJson,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');

    final mergedHeaders = {...defaultHeaders, ...?headers};

    return _handleRequest<T>(
      http.put(url, headers: mergedHeaders, body: json.encode(body)),
      fromJson ?? (data) => data,
    );
  }

  // DELETE request
  Future<ApiResponse<T>> delete<T>(
    String endpoint, {
    Map<String, String>? headers,
    T Function(dynamic)? fromJson,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');

    final mergedHeaders = {...defaultHeaders, ...?headers};

    return _handleRequest<T>(
      http.delete(url, headers: mergedHeaders),
      fromJson ?? (data) => data,
    );
  }

  // Add authorization token to headers
  Map<String, String> getHeadersWithToken(String token) {
    return {...defaultHeaders, 'Authorization': 'Bearer $token'};
  }
}
