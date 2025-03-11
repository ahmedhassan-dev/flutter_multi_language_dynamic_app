import '../../data/models/user_model.dart';
import '../repos/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<bool> execute(UserModel user) async {
    return await repository.register(user);
  }
}
