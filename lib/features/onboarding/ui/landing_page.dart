import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_language_dynamic_app/core/local_storage/Prefs.dart';
import 'package:flutter_multi_language_dynamic_app/core/router/route_constants.dart';
import 'package:flutter_multi_language_dynamic_app/features/onboarding/logic/onboarding_cubit.dart';
import 'package:go_router/go_router.dart';

import 'widgets/app_no_connection.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key, this.title = "test"});

  final String title;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (BuildContext context, OnboardingState state) {
        if (state is NoInternetConnection) return;
        if (Prefs.getCurrentUser() == null) {
          context.pushReplacement(RouteConstants.login);
        }
      },
      builder: (context, state) {
        if (state is NoInternetConnection) {
          return const AppNoConnection();
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
