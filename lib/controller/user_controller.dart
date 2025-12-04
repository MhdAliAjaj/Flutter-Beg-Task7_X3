import '../core/network/user_service.dart';
import '../core/utils/shared_preference.dart';
import '../model/api_response.dart';
import '../model/user_model.dart';

class UserController {
  final UserService _userService;
  final SharedPrefs _sharedPrefs;
  User? _cachedUser;

  UserController({
    required UserService userService,
    required SharedPrefs sharedPrefs,
  }) : _userService = userService,
       _sharedPrefs = sharedPrefs;

  // Get user profile
  Future<ApiResponse<User>> getUserProfile({bool forceRefresh = false}) async {
    print('UserController: Getting user profile');

    final token = _sharedPrefs.getToken();
    final userId = _sharedPrefs.getUserId();

    if (token == null || userId == null) {
      print('UserController: User not authenticated');
      return ApiResponse.error('User not authenticated');
    }

    // Return cached user if available
    if (_cachedUser != null && !forceRefresh) {
      print('UserController: Returning cached user data');
      return ApiResponse.success(_cachedUser!);
    }

    final response = await _userService.getUserProfile(userId, token: token);

    if (response.success && response.data != null) {
      _cachedUser = response.data! as User?;

      // Update local storage with fresh data
      await _sharedPrefs.saveUserData(response.data!.toJson());

      print('UserController: User profile loaded and cached');
    } else {
      print('UserController: Failed to load user profile: ${response.message}');
    }

    return response;
  }
  //get user image

  Future<String?> getProfileImage() async {
    try {
      final localData = _sharedPrefs.getUserData();
      if (localData != null && localData['image'] != null) {
        return localData['image'].toString();
      }
      final token = _sharedPrefs.getToken();
      if (token != null) {
        final response = await _userService.getCurrentUser(token: token);
        if (response.success && response.data != null) {
          return response.data!.image;
        }
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  // Update user profile
  Future<ApiResponse<Object>> updateProfile({
    String? email,
    String? username,
    String? imageUrl,
    String? password,
  }) async {
    final token = _sharedPrefs.getToken();
    final userId = _sharedPrefs.getUserId();

    if (token == null || userId == null) {
      return ApiResponse.error('User not authenticated');
    }

    final response = await _userService.updateProfile(
      userId: userId,
      token: token,
      email: email,
      username: username,
      password: password,
      imageUrl: imageUrl,
    );

    if (response.success && response.data != null) {
      _cachedUser = response.data! as User?;

      // Update local storage
      await _sharedPrefs.saveUserData(response.data!.toJson());
    } else {
      print('UserController: Profile update failed: ${response.message}');
    }

    return response;
  }

  User? getCurrentUser() {
    if (_cachedUser != null) {
      return _cachedUser;
    }

    final userData = _sharedPrefs.getUserData();
    if (userData != null) {
      try {
        _cachedUser = User.fromJson(userData);
        return _cachedUser;
      } catch (e) {}
    }

    return null;
  }

  Future<Map<String, dynamic>> updateProfileData({
    required String fullName,
    required String email,
    required String password,
    String? phone,
  }) async {
    try {
      final token = _sharedPrefs.getToken();
      final userId = _sharedPrefs.getUserId();

      if (token == null || userId == null) {
        return {'success': false, 'message': 'User not authenticated'};
      }
      final nameParts = fullName.trim().split(' ');
      final firstName = nameParts.first;
      Map<String, dynamic> updateData = {
        'firstName': firstName,
        'email': email,
        'password': password,
      };

      if (password != '***********' && password.isNotEmpty) {
        updateData['password'] = password;
      }

      final response = await _userService.updateProfile(
        userId: userId,
        token: token,
        firstName: firstName,
        email: email,
      );

      if (response.success && response.data != null) {
        await _sharedPrefs.saveUserData(response.data!.toJson());

        if (password != '***********' && password.isNotEmpty) {}

        return {
          'success': true,
          'message': 'Profile updated successfully',
          'user': response.data!,
        };
      } else {
        return {
          'success': false,
          'message': response.message ?? 'Failed to update profile',
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Error: ${e.toString()}'};
    }
  }

  Future<Map<String, String>> getUserProfileData() async {
    try {
      final token = _sharedPrefs.getToken();
      if (token != null) {
        final response = await _userService.getCurrentUser(token: token);
        if (response.success && response.data != null) {
          final user = response.data!;
          await _sharedPrefs.saveUserData(user.toJson());
          return {
            'fullName': user.fullName,
            'email': user.email,
            'password': user.password,
            'status': 'success',
          };
        }
      }
      final localData = _sharedPrefs.getUserData();
      if (localData != null) {
        final firstName = localData['name']?['firstname'] ?? '';
        final fullName = '$firstName'.trim();
        final email = localData['email'] ?? '';
        return {
          'fullName': fullName.isNotEmpty ? fullName : 'Fregemmer X',
          'email': email.isNotEmpty ? email : 'programmer@gmail.com',
          'password': '***********',
          'status': 'success',
        };
      }
      return {
        'fullName': 'Fregemmer X',
        'email': 'programmer@gmail.com',
        'password': '***********',
        'phone': '',
        'status': 'default',
      };
    } catch (error) {
      return {
        'fullName': 'Fregemmer X',
        'email': 'programmer@gmail.com',
        'password': '***********',
        'phone': '',
        'status': 'error',
        'error': error.toString(),
      };
    }
  }

  Future<Map<String, dynamic>> updateUserImage(String imageUrl) async {
    try {
      final token = _sharedPrefs.getToken();
      final userId = _sharedPrefs.getUserId();

      if (token == null || userId == null) {
        return {'success': false, 'message': 'User not authenticated'};
      }

      final response = await _userService.updateProfile(
        userId: userId,
        token: token,
        imageUrl: imageUrl,
      );

      if (response.success && response.data != null) {
        await _sharedPrefs.saveUserData(response.data!.toJson());

        return {
          'success': true,
          'message': 'Profile image updated successfully',
          'imageUrl': imageUrl,
        };
      } else {
        return {
          'success': false,
          'message': response.message ?? 'Failed to update image',
        };
      }
    } catch (error) {
      return {'success': false, 'message': 'Error: ${error.toString()}'};
    }
  }

  // Clear user cache
  void clearCache() {
    _cachedUser = null;
  }
}
