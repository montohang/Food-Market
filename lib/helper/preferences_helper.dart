part of 'helper.dart';

class PreferencesHelper {
  Future<bool> saveString(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(key, value);
  }

  Future<bool> saveInt(String key, int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setInt(key, value);
  }

  Future<String> getString(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getString(key);
  }

  Future<int> getInt(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getInt(key);
  }
}
