import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class UserViewmodel {
  final userRepo = UserRepository();

  Future<UserModel?> getUser() async {
    return await userRepo.getUser();
  }

  Future<void> logout() async {
    await userRepo.logout();
  }

  Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    final user = await userRepo.login(email: email, password: password);
    return user;
  }
}
