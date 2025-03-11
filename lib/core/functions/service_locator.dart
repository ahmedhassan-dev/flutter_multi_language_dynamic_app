import 'package:dio/dio.dart';
import 'package:flutter_multi_language_dynamic_app/features/authentication/domain/usecases/login_usecase.dart';
import 'package:flutter_multi_language_dynamic_app/features/authentication/domain/usecases/register_usecase.dart';
import 'package:get_it/get_it.dart';

import '../../features/authentication/data/data_sources/auth_local_data_source.dart';
import '../../features/authentication/data/repos/auth_repository_impl.dart';
import '../../features/authentication/presentation/manager/auth_cubit/auth_cubit.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(
      loginUseCase: LoginUseCase(AuthRepositoryImpl(AuthLocalDataSource())),
      registerUseCase: RegisterUseCase(getIt<AuthRepositoryImpl>())));

  getIt.registerLazySingleton<AuthRepositoryImpl>(
      () => AuthRepositoryImpl(AuthLocalDataSource()));
}
