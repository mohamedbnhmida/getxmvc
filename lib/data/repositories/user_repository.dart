import 'package:dio/dio.dart';
import 'package:flutter_mvc_getx/data/models/login_error_model.dart';
import 'package:flutter_mvc_getx/utils/api_routes.dart';
import '../models/user_model.dart'; 

class UserRepository {
  final Dio _dio = Dio();

  Future<User> login(String username, String password) async {
    try {
      final response = await _dio.post(ApiRoutes.login, data: {
        'username': username,
        'password': password,
      });
      return User.fromJson(response.data);
    } catch (e) {
      if (e is DioError && e.response?.data != null) {
        throw Error.fromJson(e.response!.data);
      } else {
        throw Exception('Failed to login');
      }
    }
  }
}
