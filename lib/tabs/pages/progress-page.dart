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

  void setData() async {
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
    try {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/progresspage.png'),
                    ),
                    Text('Workout Goal: $_motivation',
                        style: TextStyle(color: Colors.black, fontSize: 18.0)),
                    Text('\nCurrent Level: $_level ',
                        style: TextStyle(color: Colors.blue, fontSize: 16.0)),
                    Text('\nCurrent Progress: $_currentProgress ',
                        style: TextStyle(color: Colors.blue, fontSize: 16.0)),
                    Text('\nCurrent Progress to Level Up: $_progressToLevelUp ',
                        style: TextStyle(color: Colors.blue, fontSize: 16.0)),
                    Text('\nChest Level: $_chestLevel ',
                        style: TextStyle(color: Colors.blue, fontSize: 15.0)),
                    Text('\nBack Level: $_backLevel ',
                        style: TextStyle(color: Colors.blue, fontSize: 15.0)),
                    Text('\nArms Level: $_armsLevel ',
                        style: TextStyle(color: Colors.blue, fontSize: 15.0)),
                    Text('\nShoulders  Level: $_shouldersLevel ',
                        style: TextStyle(color: Colors.blue, fontSize: 15.0)),
                    Text('\nLegs Level: $_legsLevel ',
                        style: TextStyle(color: Colors.blue, fontSize: 15.0)),
                    Text('\nStrength Level: $_strengthLevel ',
                        style: TextStyle(color: Colors.blue, fontSize: 15.0)),
                    Text(
                      '\nCalorie Level: $_calorieLevel',
                      style: TextStyle(color: Colors.blue, fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } catch (e) {
      if (e != null) {
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        return null;
      }
    }
  }
}
