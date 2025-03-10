import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  void checkInternet() {
    InternetConnection().onStatusChange.listen((InternetStatus status) {
      if (status == InternetStatus.disconnected) {
        emit(NoInternetConnection());
      } else {
        emit(OnboardingInitial());
      }
    });
  }
}
