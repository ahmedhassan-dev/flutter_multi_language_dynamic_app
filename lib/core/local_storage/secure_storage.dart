import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  factory SecureStorageHelper() => _instance;
  SecureStorageHelper._internal();
  static final SecureStorageHelper _instance = SecureStorageHelper._internal();

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));

  FlutterSecureStorage get storage => _storage;

  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return _storage.read(key: key);
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> storeUserToken(String value) async {
    await _storage.write(key: "userToken", value: value);
  }

  Future<String?> getUserToken() async {
    return _storage.read(key: "userToken");
  }
}
