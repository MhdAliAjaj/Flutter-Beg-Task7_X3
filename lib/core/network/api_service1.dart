import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://dummyjson.com";

  static Future<String> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/auth/login');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['accessToken'] != null) {
        return data['accessToken'];
      } else {
        throw Exception('Login failed: accessToken not found');
      }
    } else {
      throw Exception('Login failed: ${response.body}');
    }
  }
}
