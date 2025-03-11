import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';

import '../../../data/models/user_model.dart';
import '../../../domain/usecases/login_usecase.dart';
import '../../../domain/usecases/register_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthCubit({required this.loginUseCase, required this.registerUseCase})
      : super(AuthInitial());

  Future<void> login(String username, String password, String userType) async {
    emit(AuthLoading());
    try {
      final success = await loginUseCase.execute(username, password, userType);
      if (success) {
        emit(LoginSuccess());
      } else {
        emit(AuthFailure('loginFailed'.tr()));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> register(UserModel user) async {
    emit(AuthLoading());
    try {
      final success = await registerUseCase.execute(user);
      if (success) {
        emit(RegisterSuccess());
      } else {
        emit(AuthFailure('registrationFailed'.tr()));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
