import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class UserViewmodel {
  final userRepository = UserRepository();

  Future<UserModel?> getUser() async {
    return await userRepository.getUser();
  }

  Future<void> logout() async {
    await userRepository.logout();
  }

  Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    final user = await userRepository.login(email: email, password: password);
    return user;
  }
}
