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
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Image(
                        image: AssetImage(
                          'assets/progresspage.png',
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Column(
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.orange,
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MultiColorText(
                                textOne: 'Workout Goal:',
                                textTwo: '$_motivation',
                                colorOne: Colors.white,
                                colorTwo: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.orange,
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MultiColorText(
                                textOne: 'Current Level:',
                                textTwo: '$_level',
                                colorOne: Colors.white,
                                colorTwo: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.orange,
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MultiColorText(
                                textOne: 'Current Week Progress:',
                                textTwo: '$_currentProgress',
                                colorOne: Colors.white,
                                colorTwo: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.orange,
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MultiColorText(
                                textOne: 'Weeks Left Until Level Up:',
                                textTwo: '${2 - _progressToLevelUp}',
                                colorOne: Colors.white,
                                colorTwo: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.orange,
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MultiColorText(
                                textOne: 'Chest Level:',
                                textTwo: '$_chestLevel',
                                colorOne: Colors.white,
                                colorTwo: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.orange,
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MultiColorText(
                                textOne: 'Back Level:',
                                textTwo: '$_backLevel',
                                colorOne: Colors.white,
                                colorTwo: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.orange,
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MultiColorText(
                                textOne: 'Arms Level:',
                                textTwo: '$_armsLevel',
                                colorOne: Colors.white,
                                colorTwo: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.orange,
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MultiColorText(
                                textOne: 'Shoulder Level:',
                                textTwo: '$_shouldersLevel',
                                colorOne: Colors.white,
                                colorTwo: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.orange,
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MultiColorText(
                                textOne: 'Legs Level:',
                                textTwo: '$_legsLevel',
                                colorOne: Colors.white,
                                colorTwo: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.orange,
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MultiColorText(
                                textOne: 'Strength Level:',
                                textTwo: '$_strengthLevel',
                                colorOne: Colors.white,
                                colorTwo: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.orange,
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MultiColorText(
                                textOne: 'Weight-Loss Level:',
                                textTwo: '$_weightLossLevel',
                                colorOne: Colors.white,
                                colorTwo: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white70),
                    ),
                    minWidth: 150.0,
                    height: 50.0,
                    color: Colors.lightBlueAccent,
                    textColor: Colors.black,
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('View Progress'.toUpperCase()),
                        Icon(Icons.vertical_align_top)
                      ],
                    ),
                  ),
                  SizedBox(height: 2.5),
                ],
              ),
            ),
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
