import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  Future<dynamic> readData(String strKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final storedData = prefs.getString(strKey);
    return storedData;
  }

  Future<dynamic> removeData(String strKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(strKey);
  }

  Future<dynamic> storeData(String strKey, String strValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(strKey, strValue);
  }
}
