import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fitness_app/services/exercises.dart';
import 'package:fitness_app/pages/workout-details-page.dart';
import 'package:fitness_app/services/shared-pref-helper.dart';

class WorkoutPlan extends StatefulWidget {
  @override
  _WorkoutPlanState createState() => _WorkoutPlanState();
}

class _WorkoutPlanState extends State<WorkoutPlan> {
  SharedPreferences prefs;

  String _motivation;
  String _apiLink = '';
  int _planLength;

  int _currentProgress;
  int _userLevel;
  int _progressToLevelUp;

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
    SharedPreferencesHelper.getUserLevel(prefs).then((level) {
      setState(() {
        this._userLevel = level;
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
    levelPicker();
  }

  void levelPicker() async {
    SharedPreferencesHelper.getMotivation(prefs).then((motivation) {
      this._motivation = motivation;
      if (motivation == 'I want to gain strength') {
        if (_userLevel == 1) {
          _apiLink =
              'https://raw.githubusercontent.com/tonynguyen98/Fake-JSON-Server/master/test.json'; //level 1
        } else if (_userLevel == 2) {
          _apiLink =
              'https://raw.githubusercontent.com/tonynguyen98/Fake-JSON-Server/master/test.json'; //level 2
        } else {
          _apiLink =
              'https://raw.githubusercontent.com/tonynguyen98/Fake-JSON-Server/master/excerciseList.json'; //default
        }
      } else if (motivation == 'I want to lose weight') {
        if (_userLevel == 1) {
          _apiLink =
              'https://raw.githubusercontent.com/tonynguyen98/Fake-JSON-Server/master/test.json'; //level 1
        } else if (_userLevel == 2) {
          _apiLink =
              'https://raw.githubusercontent.com/tonynguyen98/Fake-JSON-Server/master/test.json'; //level 2
        } else {
          _apiLink =
              'https://raw.githubusercontent.com/tonynguyen98/Fake-JSON-Server/master/excerciseList.json';
        } //default
      } else {
        _apiLink =
            'https://raw.githubusercontent.com/tonynguyen98/Fake-JSON-Server/master/excerciseList.json'; //default list
      }
    });
  }

  void showAlertDialog(BuildContext context) {
    Widget cancelButton = FlatButton(
      child: Text('Cancel'),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text('Continue'),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text('WARNING'),
      content: Text(
          'You have not completed this workout, do you still want to exit? Your data will be saved.'),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<List<Exercises>> _getExercises() async {
    var data = await http.get(_apiLink);
    var jsonData = json.decode(data.body);

    List<Exercises> exercises = [];

    for (var type in jsonData) {
      Exercises ex = Exercises(
          type['exerciseName'],
          type['bodyPart'],
          type['strength'],
          type['description'],
          type['exerciseExample'],
          type['muscleBody']);
      exercises.add(ex);
    }
    _planLength = exercises.length;
    return exercises;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Exercise List'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
              future: _getExercises(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(snapshot.data[index].exerciseName),
                        onTap: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) =>
                                  WorkoutDetailsPage(snapshot.data[index]),
                            ),
                          );
                          _currentProgress++;
                          SharedPreferencesHelper.setCurrentProgress(
                              _currentProgress);
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
          MaterialButton(
            minWidth: double.infinity,
            height: 50.0,
            onPressed: () {
              if (_currentProgress < _planLength) {
                showAlertDialog(context);
              } else {
                Navigator.pop(context);
                _currentProgress = 0;
                SharedPreferencesHelper.setCurrentProgress(_currentProgress);
                _progressToLevelUp++;
                SharedPreferencesHelper.setProgressToLevelUp(
                    _progressToLevelUp);
              }
              if (_progressToLevelUp == 3) {
                _userLevel++;
                SharedPreferencesHelper.setUserLevel(_userLevel);
                _progressToLevelUp = 0;
                SharedPreferencesHelper.setProgressToLevelUp(
                    _progressToLevelUp);
              } else {
                print(_progressToLevelUp);
              }
            },
            child: Text(
              'I\'m Done'.toUpperCase(),
            ),
            color: Colors.lightBlue,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
