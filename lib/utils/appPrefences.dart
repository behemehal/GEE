import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences appPrefences;

class AppPrefences {
  Future<bool> init() async {
    appPrefences = await SharedPreferences.getInstance();
    return true;
  }
}
