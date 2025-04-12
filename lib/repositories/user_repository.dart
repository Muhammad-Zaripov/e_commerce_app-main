import '../datasources/user/user_local_datasources.dart';
import '../datasources/user/user_remote_datasources.dart';
import '../models/user_model.dart';

class UserRepository {
  final userRemoteDatasource = UserRemoteDatasource();
  final userLocalDatasource = UserLocalDatasource();

  Future<UserModel?> getUser() async {
    return await userLocalDatasource.getUser();
  }

  Future<void> logout() async {
    await userLocalDatasource.deleteUser();
  }

  Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    final user = await userRemoteDatasource.login(
      email: email,
      password: password,
    );
    if (user != null) {
      await userLocalDatasource.saveUser(user);
    }

    return user;
  }
}
