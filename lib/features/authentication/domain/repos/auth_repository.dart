import 'package:flutter_multi_language_dynamic_app/features/authentication/data/models/user_model.dart';

abstract class AuthRepository {
  Future<bool> login(String username, String password, String userType);
  Future<bool> register(UserModel user);
  Future<void> saveUserLocally(UserModel user);
  Future<UserModel?> getSavedUser();
  Future<void> clearSavedUser();
}
