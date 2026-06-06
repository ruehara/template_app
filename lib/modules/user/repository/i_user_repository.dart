import '../model/user_model.dart';

abstract interface class IUserRepository {
  Future<List<UserModel>> getUsers();
}
