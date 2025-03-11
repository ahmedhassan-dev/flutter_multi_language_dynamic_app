// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common_utils/app_constant.dart';
import '../../../../core/local_storage/Prefs.dart';
import '../../../../core/router/route_constants.dart';
import '../../../../core/view/widgets/custom_text_field.dart';
import '../../../../core/view/widgets/main_button.dart';
import '../manager/auth_cubit/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();
  String userType = 'admin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr('appName')),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              final locale = context.locale.languageCode == 'ar' ? 'en' : 'ar';
              Prefs.setString(AppConstants.myLanguage, locale);
              context.setLocale(Locale(locale));
            },
          ),
        ],
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            context.pushReplacement(RouteConstants.mainDir);
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              children: [
                CustomTextField(
                  labelText: 'username'.tr(),
                  controller: _usernameController,
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  labelText: 'password'.tr(),
                  controller: _passwordController,
                  obscureText: true,
                ),
                SizedBox(height: 20.h),
                DropdownButton<String>(
                  value: context.tr(userType),
                  items: ['admin'.tr(), 'user'.tr()].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    userType = value!.toLowerCase();
                    setState(() {});
                  },
                ),
                SizedBox(height: 20.h),
                MainButton(
                  text: 'login'.tr(),
                  onTap: () {
                    context.read<AuthCubit>().login(
                          _usernameController.text,
                          _passwordController.text,
                          userType,
                        );
                  },
                ),
                SizedBox(height: 20.h),
                TextButton(
                  onPressed: () {
                    context.pushReplacement(RouteConstants.register);
                  },
                  child: Text('register'.tr()),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
