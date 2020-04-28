import 'package:fitness_app/ui/alert-dialog.dart';
import 'package:fitness_app/ui/multi-color-text.dart';
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
  int _weightLossLevel;

  String _alertContent = '';

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() async {
    prefs = await SharedPreferences.getInstance();
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
    SharedPreferencesHelper.getWeightLossLevel(prefs).then((calorieLevel) {
      setState(() {
        this._weightLossLevel = calorieLevel;
      });
    });
  }

  void _feedback() {
    if (_motivation == 'I want to gain strength') {
      if (_chestLevel % 5 == 0) {
        _alertContent = 'chest';
        _alert(context);
      }
      if (_backLevel % 5 == 0) {
        _alertContent = 'back';
        _alert(context);
      }
      if (_armsLevel % 5 == 0) {
        _alertContent = 'arms';
        _alert(context);
      }
      if (_shouldersLevel % 5 == 0) {
        _alertContent = 'shoulder';
        _alert(context);
      }
      if (_legsLevel % 5 == 0) {
        _alertContent = 'legs';
        _alert(context);
      }
      if (_strengthLevel % 5 == 0) {
        _alertContent = 'overall';
        _alert(context);
      }
    } else {
      _alert(context);
    }
  }

  void _alert(BuildContext context) {
    String _comment;
    if (_motivation == 'I want to gain strength') {
      _comment = 'You have progressed your $_alertContent strength!';
    } else if (_motivation == 'I want to lose weight') {
      _comment = 'You\'re losing weight. Keep up the good work';
    }
    return ShowAlertDialog(
      cancelButtonToggle: false,
      mainButtonText: 'Close',
      mainButtonOnPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
      alertTitle: 'Congratulations',
      alertContent: _comment,
    ).showAlertDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    try {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 40.0),
                  Image(
                    image: AssetImage('assets/progresspage.png'),
                  ),
                  Flexible(
                    child: ListWheelScrollView(
                      itemExtent: 50.0,
                      diameterRatio: 1.8,
                      children: <Widget>[
                        MultiColorText(
                          textOne: 'Workout Goal:',
                          textTwo: '$_motivation ',
                          colorOne: Colors.black,
                          colorTwo: Colors.black,
                          fontSize: 18.0,
                        ),
                        MultiColorText(
                          textOne: 'Current Level:',
                          textTwo: '$_level',
                          colorOne: Colors.orange,
                          colorTwo: Colors.blue,
                          fontSize: 16.0,
                        ),
                        MultiColorText(
                          textOne: 'Current Week Progress:',
                          textTwo: '$_currentProgress',
                          colorOne: Colors.orange,
                          colorTwo: Colors.blue,
                          fontSize: 16.0,
                        ),
                        MultiColorText(
                          textOne: 'Weeks Left Until Level Up:',
                          textTwo: '${2 - _progressToLevelUp}',
                          colorOne: Colors.orange,
                          colorTwo: Colors.blue,
                          fontSize: 16.0,
                        ),
                        MultiColorText(
                          textOne: 'Chest Level:',
                          textTwo: '$_chestLevel',
                          colorOne: Colors.orange,
                          colorTwo: Colors.blue,
                          fontSize: 16.0,
                        ),
                        MultiColorText(
                          textOne: 'Back Level:',
                          textTwo: '$_backLevel',
                          colorOne: Colors.orange,
                          colorTwo: Colors.blue,
                          fontSize: 16.0,
                        ),
                        MultiColorText(
                          textOne: 'Arms Level:',
                          textTwo: '$_armsLevel',
                          colorOne: Colors.orange,
                          colorTwo: Colors.blue,
                          fontSize: 16.0,
                        ),
                        MultiColorText(
                          textOne: 'Shoulder Level:',
                          textTwo: '$_shouldersLevel',
                          colorOne: Colors.orange,
                          colorTwo: Colors.blue,
                          fontSize: 16.0,
                        ),
                        MultiColorText(
                          textOne: 'Legs Level:',
                          textTwo: '$_legsLevel',
                          colorOne: Colors.orange,
                          colorTwo: Colors.blue,
                          fontSize: 16.0,
                        ),
                        MultiColorText(
                          textOne: 'Strength Level:',
                          textTwo: '$_strengthLevel',
                          colorOne: Colors.orange,
                          colorTwo: Colors.blue,
                          fontSize: 16.0,
                        ),
                        MultiColorText(
                          textOne: 'Weight-Loss Level:',
                          textTwo: '$_weightLossLevel',
                          colorOne: Colors.orange,
                          colorTwo: Colors.blue,
                          fontSize: 16.0,
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 40.0,
                    child: Text(
                      "View Progress",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    onPressed: () {
                      if (_armsLevel >= 2 ||
                          _chestLevel >= 2 ||
                          _backLevel >= 2 ||
                          _shouldersLevel >= 2 ||
                          _legsLevel >= 2 ||
                          _strengthLevel >= 2 ||
                          _weightLossLevel >= 2) {
                        _feedback();
                        //  displayResults();
                      } else {
                        return null;
                      }
                    },
                    color: Colors.lightBlue,
                    textColor: Colors.white,
                  ),
                ]),
          ),
        ),
      );
    } catch (e) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
