import 'dart:convert';
import '../../data/models/user_model.dart';
import '../../domain/repos/auth_repository.dart';
import '../data_sources/auth_local_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl(this.localDataSource);

  @override
  Future<bool> login(String username, String password, String userType) async {
    final usersJson = localDataSource.getUsers();
    if (usersJson != null) {
      final users = (jsonDecode(usersJson) as List)
          .map((e) => UserModel.fromJson(e))
          .toList();
      final user = users.firstWhere(
        (user) =>
            user.username == username &&
            user.password == password &&
            user.userType == userType,
        orElse: () => UserModel(
          fullName: '',
          username: '',
          password: '',
          email: '',
          phone: '',
          userType: '',
        ),
      );
      if (user.username.isNotEmpty) {
        await localDataSource.saveCurrentUser(jsonEncode(user.toJson()));
        return true;
      }
    }
    return false;
  }

  @override
  Future<bool> register(UserModel user) async {
    final usersJson = localDataSource.getUsers();
    List<UserModel> users = [];
    if (usersJson != null) {
      users = (jsonDecode(usersJson) as List)
          .map((e) => UserModel.fromJson(e))
          .toList();
    }
    users.add(user);
    await localDataSource
        .saveUsers(jsonEncode(users.map((e) => e.toJson()).toList()));
    return true;
  }

  @override
  Future<void> saveUserLocally(UserModel user) async {
    await localDataSource.saveCurrentUser(jsonEncode(user.toJson()));
  }

  @override
  Future<UserModel?> getSavedUser() async {
    final userJson = localDataSource.getCurrentUser();
    if (userJson != null) {
      return UserModel.fromJson(jsonDecode(userJson));
    }
    return null;
  }

  @override
  Future<void> clearSavedUser() async {
    await localDataSource.clearCurrentUser();
  }
}
