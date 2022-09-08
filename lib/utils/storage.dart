import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static late final SharedPreferences spre;
  Storage._init() {
    spre = SharedPreferences.getInstance() as SharedPreferences;
  }
}
