import '../../../../core/local_storage/Prefs.dart';

class AuthLocalDataSource {
  Future<void> saveUsers(String usersJson) async {
    await Prefs.setString('users', usersJson);
  }

  String? getUsers() {
    return Prefs.getString('users');
  }

  Future<void> saveCurrentUser(String userJson) async {
    await Prefs.setString('currentUser', userJson);
  }

  String? getCurrentUser() {
    return Prefs.getString('currentUser');
  }

  Future<void> clearCurrentUser() async {
    await Prefs.remove('currentUser');
  }
}
