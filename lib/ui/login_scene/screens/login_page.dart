import 'package:flutter/material.dart';
import 'package:flutter_mvc_getx/utils/app_colors.dart';
import 'package:flutter_mvc_getx/utils/app_routes.dart';
import 'package:flutter_mvc_getx/utils/app_strings.dart';
import 'package:flutter_mvc_getx/utils/app_theme.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart'; 
class LoginPage extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.login),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: AppStrings.usernameLabel), // Updated to use AppStrings
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: AppStrings.passwordLabel), // Updated to use AppStrings
              obscureText: true,
            ),
            SizedBox(height: 20),
            Obx(() {
              if (_loginController.isLoading.value) {
                return CircularProgressIndicator();
              } else {
                  return Theme(
              data: AppTheme.darkTheme, // Use your desired theme here
              child: ElevatedButton(
                onPressed: () {
                  _loginController.login(
                    _usernameController.text,
                    _passwordController.text,
                  );
                },
                child: Text('Login'),
              ),
            );
              }
            }),
            Obx(() {
              if (_loginController.status.value == LoginStatus.success) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Get.snackbar(
                    AppStrings.success,
                    AppStrings.loginSuccessful,
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: AppColors.snackbarSuccess,
                    colorText: AppColors.onPrimary,
                  );
                  Get.offNamed(AppRoutes.home);
                });
              } else if (_loginController.status.value == LoginStatus.error) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Get.snackbar(
                    AppStrings.error,
                    _loginController.errorMessage.value,
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: AppColors.snackbarError,
                    colorText: AppColors.onError,
                  );
                });
              }
              return SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}
