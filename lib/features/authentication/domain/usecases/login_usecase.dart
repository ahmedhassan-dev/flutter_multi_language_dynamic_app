import '../repos/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<bool> execute(
      String username, String password, String userType) async {
    return await repository.login(username, password, userType);
  }
}
