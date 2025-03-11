import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_language_dynamic_app/core/common_utils/app_view_toolbox.dart';
import 'package:flutter_multi_language_dynamic_app/core/local_storage/Prefs.dart';
import 'package:flutter_multi_language_dynamic_app/core/router/route_constants.dart';
import 'package:flutter_multi_language_dynamic_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter_multi_language_dynamic_app/features/onboarding/logic/onboarding_cubit.dart';
import 'package:go_router/go_router.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (BuildContext context, OnboardingState state) {
        if (state is NoInternetConnection) {
          ViewToolBox.showErrorMessage(context.tr("No Internet Connection"));
        }
        if (Prefs.getCurrentUser() == null) {
          context.pushReplacement(RouteConstants.login);
        }
      },
      builder: (context, state) {
        return const HomePage();
      },
    );
  }
}
