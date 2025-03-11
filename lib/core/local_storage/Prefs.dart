// ignore_for_file: file_names, depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter_multi_language_dynamic_app/features/authentication/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _prefs;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static Future<bool> setString(String key, String value) async =>
      await _prefs.setString(key, value);

  static String? getString(String key) => _prefs.getString(key);

  static UserModel? getCurrentUser() {
    String? currentUser = _prefs.getString('currentUser');
    return currentUser != null
        ? UserModel.fromJson(jsonDecode(currentUser))
        : null;
  }

  //deletes..
  static Future<bool> remove(String key) async => await _prefs.remove(key);

  static Future<bool> clear() async => await _prefs.clear();
}
