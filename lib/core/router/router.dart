import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_language_dynamic_app/landing_page.dart';
import 'package:go_router/go_router.dart';

import '../../features/onboarding/logic/onboarding_cubit.dart';
import '../common_utils/app_constant.dart';
import 'route_constants.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
      debugLogDiagnostics: kDebugMode,
      initialLocation: RouteConstants.mainDir,
      navigatorKey: AppConstants.navigatorKey,
      routes: [
        GoRoute(
          path: RouteConstants.mainDir,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => OnboardingCubit()..checkInternet(),
              child: const LandingPage(),
            ),
          ),
        ),
      ]);

  const AppRouter._();
}

class ErrorScreen extends StatelessWidget {
  final Exception? error;

  const ErrorScreen({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const CloseButton()),
      body: const Center(
        child: Text('Something went wrong!'),
      ),
    );
  }
}
