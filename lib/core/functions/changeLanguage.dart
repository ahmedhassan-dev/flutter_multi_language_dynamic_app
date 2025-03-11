// ignore: file_names
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../common_utils/app_constant.dart';
import '../local_storage/Prefs.dart';

void changeLanguage(BuildContext context) {
  final locale = context.locale.languageCode == 'ar' ? 'en' : 'ar';
  Prefs.setString(AppConstants.myLanguage, locale);
  context.setLocale(Locale(locale));
}
