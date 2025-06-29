import 'package:shared_preferences/shared_preferences.dart';

class SaveTheme {
  static late SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void setTheme(bool theme) async {
    prefs.setBool("theme", theme);
  }

  static getTheme() {
    return prefs.getBool("theme") ?? false;
  }
}
