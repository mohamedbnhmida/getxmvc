import 'package:flutter_mvc_getx/data/models/user_model.dart';
import 'package:flutter_mvc_getx/data/usecases/login_usecase.dart';
import 'package:get/get.dart'; 
import 'package:get/get.dart'; 
enum LoginStatus { idle, loading, success, error }

class LoginController extends GetxController {
  final LoginUseCase _loginUseCase = LoginUseCase();
  var user = Rxn<User>();
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var status = LoginStatus.idle.obs;

  void login(String username, String password) async {
    try {
      isLoading(true);
      status(LoginStatus.loading);
      user.value = await _loginUseCase(username, password);
      status(LoginStatus.success);
    } catch (e) {
      if (e is Error) {
        errorMessage(e.obs.string);
      } else {
        errorMessage('Login failed');
      }
      status(LoginStatus.error);
    } finally {
      isLoading(false);
    }
  }
}
