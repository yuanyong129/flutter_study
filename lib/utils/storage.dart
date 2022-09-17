import 'package:shared_preferences/shared_preferences.dart';

class StorageKeys {
  static String tokenKey = 'token';
}

class Storage {
  static late final SharedPreferences spre;
  Storage._init() {
    spre = SharedPreferences.getInstance() as SharedPreferences;
  }

  /// get the token from local
  static String? getToken() {
    return spre.getString(StorageKeys.tokenKey);
  }

  /// set the token to local
  static Future<bool> setToken(String value) async {
    return await spre.setString(StorageKeys.tokenKey, value);
  }

  /// remove token form local
  static Future<bool> removeToken() async {
    return await spre.remove(StorageKeys.tokenKey);
  }
}
