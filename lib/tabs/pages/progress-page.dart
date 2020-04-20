import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fitness_app/services/shared-pref-helper.dart';

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  SharedPreferences prefs;

  String _motivation;

  int _level;
  int _currentProgress;
  int _progressToLevelUp;

  int _chestLevel;
  int _backLevel;
  int _armsLevel;
  int _shouldersLevel;
  int _legsLevel;
  int _strengthLevel;
  int _calorieLevel;

  @override
  void initState() {
    super.initState();
    _init();
    setData();
  }

  void _init() async {
    prefs = await SharedPreferences.getInstance();
  }

  void setData() {
    SharedPreferencesHelper.getMotivation(prefs).then((motivation) {
      setState(() {
        _motivation = motivation;
      });
    });

    SharedPreferencesHelper.getUserLevel(prefs).then((level) {
      setState(() {
        this._level = level;
      });
    });
    SharedPreferencesHelper.getCurrentProgress(prefs).then((progress) {
      setState(() {
        this._currentProgress = progress;
      });
    });
    SharedPreferencesHelper.getProgressToLevelUp(prefs)
        .then((progressToLevelUp) {
      setState(() {
        this._progressToLevelUp = progressToLevelUp;
      });
    });
    SharedPreferencesHelper.getChestLevel(prefs).then((chestLevel) {
      setState(() {
        this._chestLevel = chestLevel;
      });
    });
    SharedPreferencesHelper.getBackLevel(prefs).then((backLevel) {
      setState(() {
        this._backLevel = backLevel;
      });
    });
    SharedPreferencesHelper.getArmsLevel(prefs).then((armsLevel) {
      setState(() {
        this._armsLevel = armsLevel;
      });
    });
    SharedPreferencesHelper.getShouldersLevel(prefs).then((shouldersLevel) {
      setState(() {
        this._shouldersLevel = shouldersLevel;
      });
    });
    SharedPreferencesHelper.getLegsLevel(prefs).then((legsLevel) {
      setState(() {
        this._legsLevel = legsLevel;
      });
    });
    SharedPreferencesHelper.getStrengthLevel(prefs).then((strengthLevel) {
      setState(() {
        this._strengthLevel = strengthLevel;
      });
    });
    SharedPreferencesHelper.getCalorieLevel(prefs).then((calorieLevel) {
      setState(() {
        this._calorieLevel = calorieLevel;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green[300],
        body: Center(
          child: Text(
            'User\'s Workout Goal: $_motivation'
            '\nCurrent Level: $_level '
            '\nCurrent Progress: $_currentProgress '
            '\nCurrent Progress to Level Up: $_progressToLevelUp '
            '\nChest Level: $_chestLevel '
            '\nBack Level: $_backLevel '
            '\nArms Level: $_armsLevel '
            '\nShoulders  Level: $_shouldersLevel '
            '\nLegs Level: $_legsLevel '
            '\nStrength Level: $_strengthLevel '
            '\nCalorie Level: $_calorieLevel',
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}
