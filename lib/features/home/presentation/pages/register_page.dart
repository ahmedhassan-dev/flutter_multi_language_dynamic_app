import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common_utils/app_constant.dart';
import '../../../../core/local_storage/Prefs.dart';
import '../../../../core/router/route_constants.dart';
import '../../../../core/view/widgets/custom_text_field.dart';
import '../../../../core/view/widgets/main_button.dart';
import '../../data/models/user_model.dart';
import '../manager/auth_cubit/auth_cubit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _fullNameController = TextEditingController();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();

  String userType = 'admin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('register'.tr()),
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
          if (state is RegisterSuccess) {
            context.pushReplacement(RouteConstants.login);
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField(
                    labelText: context.tr('fullName'),
                    controller: _fullNameController,
                  ),
                  SizedBox(height: 20.h),
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
                  CustomTextField(
                    labelText: 'email'.tr(),
                    controller: _emailController,
                  ),
                  SizedBox(height: 20.h),
                  CustomTextField(
                    labelText: 'phone'.tr(),
                    controller: _phoneController,
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
                    text: 'register'.tr(),
                    onTap: () {
                      final fullName = _fullNameController.text;
                      final username = _usernameController.text;
                      final password = _passwordController.text;
                      final email = _emailController.text;
                      final phone = _phoneController.text;

                      // Basic validation
                      if (isAllDataAvailable(
                          fullName, username, password, email, phone)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('all_fields_required'.tr())),
                        );
                        return;
                      }

                      // Email validation
                      if (!isValidEmail(email)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('invalid_email'.tr())),
                        );
                        return;
                      }

                      // Phone validation
                      if (!isValidPhoneNum(phone)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('invalid_phone'.tr())),
                        );
                        return;
                      }

                      // Create a new user
                      final user = UserModel(
                        fullName: fullName,
                        username: username,
                        password: password,
                        email: email,
                        phone: phone,
                        userType: userType,
                      );

                      context.read<AuthCubit>().register(user);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  bool isAllDataAvailable(String fullName, String username, String password,
      String email, String phone) {
    return fullName.isEmpty ||
        username.isEmpty ||
        password.isEmpty ||
        email.isEmpty ||
        phone.isEmpty;
  }

  bool isValidPhoneNum(String phone) {
    if (phone.isEmpty) {
      return false;
    }
    final digitsOnly = phone.replaceAll(RegExp(r'\D'), '');

    if (digitsOnly.length < 9 || digitsOnly.length > 11) {
      return false;
    }

    return true;
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
