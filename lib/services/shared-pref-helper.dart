import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final String currentOnBoardingStatus = 'onBoardingStatus';
  static final String userFirstName = 'firstName';
  static final String userLastName = 'lastName';
  static final String userGender = 'gender';
  static final String userMotivation = 'motivation';
  static final String userHeight = 'height';
  static final String userWeight = 'weight';
  static final String userExperience = 'experience';

  static Future<bool> setOnBoardingStatus(bool value, SharedPreferences prefs) {
    return prefs.setBool(currentOnBoardingStatus, value);
  }

  static bool getOnBoardingStatus(SharedPreferences prefs) {
    return prefs.containsKey(currentOnBoardingStatus)
        ? prefs.getBool(currentOnBoardingStatus ?? false)
        : false;
  }

  static Future<bool> setFirstName(String firstName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userFirstName, firstName);
  }

  static Future<String> getFirstName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _firstName = prefs.getString(userFirstName);
    return _firstName;
  }

  static Future<bool> setLastName(String lastName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userLastName, lastName);
  }

  static Future<String> getLastName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _lastName = prefs.getString(userLastName);
    return _lastName;
  }

  static Future<bool> setGender(int gender) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(userGender, gender);
  }

  static Future<String> getGender() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int _gender = prefs.getInt(userGender);
    String _genderString;
    if (_gender == 0) {
      _genderString = 'Male';
    } else if (_gender == 1) {
      _genderString = 'Female';
    } else {
      _genderString = 'GENDER ERROR';
    }
    return _genderString;
  }

  static Future<bool> setMotivation(int motivation) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(userMotivation, motivation);
  }

  static Future<String> getMotivation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int _motivation = prefs.getInt(userMotivation);
    String _motivationString;
    if (_motivation == 0) {
      _motivationString = 'I want to gain strength';
    } else if (_motivation == 1) {
      _motivationString = 'I want to lose weight';
    } else {
      _motivationString = 'MOTIVATION ERROR';
    }
    return _motivationString;
  }

  static Future<bool> setHeight(int height) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(userHeight, height);
  }

  static Future<String> getHeight() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int _userHeight = prefs.getInt(userHeight);
    return _userHeight.toString() + ' inches tall';
  }

  static Future<bool> setWeight(int weight) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(userWeight, weight);
  }

  static Future<String> getWeight() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int _userWeight = prefs.getInt(userWeight);
    return _userWeight.toString() + ' lbs';
  }

  static Future<bool> setExperience(int experience) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(userExperience, experience);
  }

  static Future<String> getEperience() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int _experience = prefs.getInt(userExperience);
    String _experienceString;
    if (_experience == 0) {
      _experienceString = 'I have no gym experience';
    } else if (_experience == 1) {
      _experienceString = 'I have some experience';
    } else if (_experience == 2) {
      _experienceString = 'I have gym experience';
    } else {
      _experienceString = "EXPERIENCE ERROR";
    }
    return _experienceString;
  }
}
