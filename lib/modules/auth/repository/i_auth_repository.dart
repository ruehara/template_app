import '../model/auth_user_model.dart';

abstract interface class IAuthRepository {
  Future<AuthUserModel> login(String username, String password);
  Future<void> logout();
  Future<AuthUserModel> getCurrentUser();
  Future<void> updateUser(String nome, String login, String? senha);
  Future<void> register({
    required String name,
    required String login,
    required String email,
    required String password,
  });
}
