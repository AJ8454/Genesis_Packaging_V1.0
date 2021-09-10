import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? _preferences;
  static const _keyUser = 'NewUser';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(bool? newUser) async =>
      await _preferences!.setBool(_keyUser, newUser!);

  static bool? getUser() => _preferences!.getBool(_keyUser);
}
