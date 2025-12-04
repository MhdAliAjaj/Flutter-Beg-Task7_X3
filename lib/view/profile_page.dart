import 'package:flutter/material.dart';
import 'package:task_7_x3/core/style/app_color.dart';
import 'package:task_7_x3/widget/profile/custom_app_bar.dart';
import 'package:task_7_x3/widget/profile/custom_text_feild.dart';
import 'package:task_7_x3/widget/profile/loading_inddicator.dart';
import 'package:task_7_x3/widget/profile/save_button.dart';
import '../controller/user_controller.dart';

import '../core/network/user_service.dart';

import '../core/network/apiservice.dart';
import '../core/utils/shared_preference.dart';
import '../widget/profile/feild_label.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserController _userController;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  // password visibility state removed (not used)
  bool _isEditing = true;
  String? _profileImageUrl;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _loadUserData();
  }

  void _initializeControllers() {
    final apiService = ApiService();
    final sharedPrefs = SharedPrefs();
    final userService = UserService(apiService: apiService);
    _userController = UserController(
      userService: userService,
      sharedPrefs: sharedPrefs,
    );
  }

  Future<void> _loadUserData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final userData = await _userController.getUserProfileData();

      _nameController.text = userData['fullName'] ?? 'Fregemmer X';
      _emailController.text = userData['email'] ?? 'programmer@gmail.com';
      _passwordController.text = userData['password'] ?? '***********';

      final imageUrl = await _userController.getProfileImage();
      if (imageUrl != null) {
        setState(() {
          _profileImageUrl = imageUrl;
        });
      }
    } catch (e) {
      print('Error loading user data: $e');

      _nameController.text = "Fregemmer X";
      _emailController.text = "programmer@gmail.com";
      _passwordController.text = "***********";
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _saveProfile() async {
    if (_nameController.text.isEmpty || _emailController.text.isEmpty) {
      _showSnackBar("Please fill in all required fields");
      return;
    }

    if (!_isValidEmail(_emailController.text)) {
      _showSnackBar("Please enter a valid email address");
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final result = await _userController.updateProfileData(
        fullName: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );

      setState(() {
        _isLoading = false;
      });

      if (result['success'] == true) {
        _showSnackBar(result['message'] ?? "Profile saved successfully!");

        await _loadUserData();

        setState(() {
          _isEditing = false;
          _passwordController.text = "***********";
        });
      } else {
        _showSnackBar(result['message'] ?? "Failed to save profile");
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showSnackBar("Error: ${e.toString()}");
    }
  }

  Future<void> _changeProfileImage() async {
    if (!_isEditing) {
      _showSnackBar("Enter edit mode to change profile picture");
      return;
    }
    _showSnackBar("Profile picture change feature coming soon!");
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColor.primary,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackground,
      appBar: CustomAppBar(title: "Profile"),
      body: _isLoading ? LoadingInddicator() : _buildProfileContent(),
    );
  }

  Widget _buildProfileContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Picture Section
          _buildProfilePicture(),
          const SizedBox(height: 40),

          // Name Field
          FeildLabel(label: 'Your Name'),
          const SizedBox(height: 8),
          CustomTextFeild(
            controller: _nameController,
            hintText: "Enter Your Name ",
            prefixIcon: Icons.person,
          ),
          const SizedBox(height: 24),
          // Email Field
          FeildLabel(label: "Email Address"),
          const SizedBox(height: 8),
          CustomTextFeild(
            controller: _emailController,
            hintText: "Enter Your Email ",
            prefixIcon: Icons.email_outlined,
          ),
          const SizedBox(height: 24),
          // Password Field
          FeildLabel(label: "Password"),
          const SizedBox(height: 8),
          CustomTextFeild(
            controller: _passwordController,
            hintText: "Enter Your Password ",
            prefixIcon: Icons.password,
          ),
          const SizedBox(height: 8),
          // Discover Password Link
          if (_isEditing) _buildDiscoverPasswordLink(),
          const SizedBox(height: 40),
          // Save Button
          if (_isEditing)
            SaveButton(
              isLoading: _isLoading,
              onPressed: _saveProfile,
              primary: AppColor.primary,
            ),
        ],
      ),
    );
  }

  Widget _buildProfilePicture() {
    return Center(
      child: GestureDetector(
        onTap: _changeProfileImage,
        child: Stack(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.fieldBackground,
                border: Border.all(color: AppColor.borderLight, width: 2),
              ),
              child: _profileImageUrl != null
                  ? ClipOval(
                      child: Image.network(
                        _profileImageUrl!,
                        fit: BoxFit.cover,
                        width: 120,
                        height: 120,
                      ),
                    )
                  : Icon(Icons.person, size: 60, color: AppColor.textHint),
            ),
            if (_isEditing)
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.primary,
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  child: Icon(Icons.edit, color: Colors.white, size: 20),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiscoverPasswordLink() {
    return GestureDetector(
      onTap: () {
        if (_isEditing) {
          _showChangePasswordDialog();
        } else {
          _showSnackBar("Enter edit mode to change password");
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          "Discover Password",
          style: TextStyle(
            color: AppColor.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
            letterSpacing: 0.1,
          ),
          textAlign: TextAlign.end,
        ),
      ),
    );
  }

  void _showChangePasswordDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Change Password"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Enter your new password:"),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "New password",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showSnackBar("Password change feature coming soon!");
            },
            child: Text("Change"),
          ),
        ],
      ),
    );
  }
}
