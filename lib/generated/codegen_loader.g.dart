// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "No Internet Connection": "لا يوجد اتصال بالشبكة",
  "Please check your connection.": "برجاء التأكد من اتصالك بالشبكة.",
  "settings": "الإعدادات",
  "home": "الرئيسية",
  "appName": "تيست",
  "admin": "ادمن",
  "user": "مستخدم",
  "posts": "المنشورات",
  "noPostsAvailable": "لا يوجد بيانات متاحة",
  "login": "تسجيل الدخول",
  "register": "تسجيل",
  "fullName": "الاسم الكامل",
  "username": "اسم المستخدم",
  "password": "كلمة المرور",
  "email": "البريد الإلكتروني",
  "phone": "الهاتف",
  "all_fields_required": "جميع الحقول مطلوبة",
  "invalid_email": "بريد إلكتروني غير صالح",
  "invalid_phone": "رقم هاتف غير صالح",
  "horizontal_scroll": "تمرير أفقي",
  "vertical_scroll": "تمرير عمودي",
  "item": "عنصر"
};
static const Map<String,dynamic> _en = {
  "No Internet Connection": "No Internet Connection",
  "Please check your connection.": "Please check your connection.",
  "settings": "Settings",
  "home": "Home",
  "appName": "Test",
  "admin": "Admin",
  "user": "User",
  "posts": "Posts",
  "noPostsAvailable": "No posts available",
  "login": "Login",
  "register": "Register",
  "fullName": "Full Name",
  "username": "Username",
  "password": "Password",
  "email": "Email",
  "phone": "Phone",
  "all_fields_required": "All fields are required",
  "invalid_email": "Invalid email address",
  "invalid_phone": "Invalid phone number",
  "horizontal_scroll": "Horizontal Scroll",
  "vertical_scroll": "Vertical Scroll",
  "item": "Item"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
