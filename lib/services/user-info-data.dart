import 'dart:async';

import 'package:fitness_app/services/shared-pref-helper.dart';

class UserInfo {
  String firstName;
  String _lastName;
  String _gender; //1 for male, //2 for female
  String _motivation; //1 for gainStrength, //2 for loseWeight
  String _height; //stored in inches
  String _weight; //stored in weight
  String _experience; //1 for none, //2 for some, //3 for experienced

  void _init() {
    SharedPreferencesHelper.getFirstName().then(updateFirstName);
    SharedPreferencesHelper.getLastName().then(updateLastName);
    SharedPreferencesHelper.getGender().then(updateGender);
    SharedPreferencesHelper.getMotivation().then(updateMotivation);
  }

  void updateFirstName(String firstName) {
    this.firstName = firstName;
  }

  void updateLastName(String lastName) {
    this._lastName = lastName;
  }

  void updateGender(String gender) {
    this._gender = gender;
  }

  void updateMotivation(String motivation) {
    _motivation = motivation;
  }

  String get getFirstName => firstName;

  String get getLastName => _lastName;

  String get getGender => _gender;

  String getMotivation() {
    /* if (_motivation == 1) {
      return 'wants to gain strength.';
    } else if (_motivation == 2) {
      return 'want to lose weight.';
    } else {
      return 'motivation error';
    }*/
  }

  String getHeight() {
    /*return _height.toString();*/
  }

  String getWeight() {
    /*return _weight.toString();*/
  }

  String getExperience() {
    /* if (_experience == 1) {
      return _firstName + ' has no experince in working out.';
    } else if (_experience == 2) {
      return _firstName + ' has some experince in working out.';
    } else if (_experience == 3) {
      return _firstName + ' is experienced in working out.';
    } else {
      return 'experience error';
    }*/
  }
}
