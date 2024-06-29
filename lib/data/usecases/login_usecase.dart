import '../repositories/user_repository.dart';
import '../models/user_model.dart'; 

class LoginUseCase {
  final UserRepository _userRepository = UserRepository();

  Future<User> call(String username, String password) async {
    return await _userRepository.login(username, password);
  }
}
