import 'package:shared_preferences/shared_preferences.dart';

class LocalStroage {
  Future<bool> setandSaveValue(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    return true;
  }

  Future<String> getSaveValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString(key) ?? '';
    return value;
  }
}