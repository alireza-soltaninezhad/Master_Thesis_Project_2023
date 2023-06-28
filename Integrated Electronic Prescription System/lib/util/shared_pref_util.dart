
import 'package:insurance/util/encrypt_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {

  static SharedPreferences? sharedPreference;

  SharedPreferencesUtil(SharedPreferences? sharedPreference) {
    SharedPreferencesUtil.sharedPreference = sharedPreference;
  }

  String getString(String key) {
    return EncryptUtil.decrypt(sharedPreference?.getString(key) ?? "");
  }

  Future<bool>? setString(String key, String value) {
    return sharedPreference?.setString(key, EncryptUtil.encrypt(value));
  }

  bool getBool(String key) {
    return sharedPreference?.getBool(key) ?? false;
  }

  Future<bool>? setBool(String key, bool value) {
    return sharedPreference?.setBool(key, value);
  }

}