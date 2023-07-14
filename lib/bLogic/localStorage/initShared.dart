import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesCustom {
  static late SharedPreferences prefs;
  Future<SharedPreferences> initShared() async {
    prefs = await SharedPreferences.getInstance();
    return prefs;
  }
}
