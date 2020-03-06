import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final String currentOnBoardingStatus = 'onBoardingStatus';

  static bool getOnBoardingStatus(SharedPreferences prefs) {
    return prefs.containsKey(currentOnBoardingStatus)
        ? prefs.getBool(currentOnBoardingStatus ?? false)
        : false;
  }

  static Future<bool> setOnBoardingStatus(bool value, SharedPreferences prefs) {
    return prefs.setBool(currentOnBoardingStatus, value);
  }
}
