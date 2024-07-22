import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final SharedPreferencesHelper _instance = SharedPreferencesHelper._internal();
  late SharedPreferences _prefs;

  factory SharedPreferencesHelper() {
    return _instance;
  }

  SharedPreferencesHelper._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveImagePath(String path) async {
    await _prefs.setString('profileImagePath', path);
  }

  String? getImagePath() {
    return _prefs.getString('profileImagePath');
  }
}
