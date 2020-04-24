import 'dart:io';

import 'package:fitness_app/ui/alert-dialog.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitness_app/pages/workout-details-page.dart';

import 'package:fitness_app/services/exercises.dart';
import 'package:fitness_app/pages/exercise-details-page.dart';
import 'package:fitness_app/services/shared-pref-helper.dart';
import 'package:fitness_app/services/workouts.dart';

class WorkoutPlan extends StatefulWidget {
  @override
  _WorkoutPlanState createState() => _WorkoutPlanState();
}

class _WorkoutPlanState extends State<WorkoutPlan> {
  Future<List<Workouts>> futureWorkouts;
  SharedPreferences prefs;

  String _apiLink = '';
  int _planLength;

  int _currentProgress;
  int _userLevel;
  int progressToLevelUp;
  String _motivation;

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
    SharedPreferencesHelper.getCurrentProgress(prefs).then((progress) {
      setState(() {
        this._currentProgress = progress;
      });
    });
    SharedPreferencesHelper.getProgressToLevelUp(prefs)
        .then((progressToLevelUp) {
      setState(() {
        this.progressToLevelUp = progressToLevelUp;
      });
    });
    SharedPreferencesHelper.getMotivation(prefs).then((motivation) {
      setState(() {
        this._motivation = motivation;
      });
    });
    SharedPreferencesHelper.getUserLevel(prefs).then((level) {
      setState(() {
        this._userLevel = level;
      });
    });
    futureWorkouts = _getWorkouts();
  }

  void _alert(BuildContext context) {
    return ShowAlertDialog(
            cancelButtonToggle: true,
            mainButtonText: 'Continue',
            mainButtonOnPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.pop(context);
            },
            alertTitle: 'Are you done for the day?',
            alertContent: 'Your data will be saved.')
        .showAlertDialog(context);
  }

  Future<List<Workouts>> _getWorkouts() async {
    await SharedPreferencesHelper.getUserLevel(prefs).then((level) {
      if (_motivation == 'I want to gain strength') {
        if (level == 1) {
          _apiLink =
              'https://raw.githubusercontent.com/tonynguyen98/Fake-JSON-Server/master/strengthLevel1.json'; //level 1
        } else if (level == 2) {
          print(_userLevel);
          _apiLink =
              'https://raw.githubusercontent.com/tonynguyen98/Fake-JSON-Server/master/strengthLevel2.json'; //level 2
        } else if (level >= 3) {
          _apiLink =
              'https://raw.githubusercontent.com/tonynguyen98/Fake-JSON-Server/master/generated.json'; //default
        }
      } else if (_motivation == 'I want to lose weight') {
        if (level == 1) {
          _apiLink =
              'https://raw.githubusercontent.com/tonynguyen98/Fake-JSON-Server/master/weightLossLevel1.json'; //level 1
        } else if (level == 2) {
          _apiLink =
              'https://raw.githubusercontent.com/tonynguyen98/Fake-JSON-Server/master/weightLossLevel2.json'; //level 2
        } else if (level >= 3) {
          _apiLink =
              'https://raw.githubusercontent.com/tonynguyen98/Fake-JSON-Server/master/generated.json';
        } //default
      } else {
        print('ERROR'); //default list
      }
    });

    sleep(Duration(microseconds: 30));

    var data = await http.get(_apiLink);
    List<Workouts> workouts;

    workouts = (json.decode(data.body) as List)
        .map((i) => Workouts.fromJson(i))
        .toList();

    _planLength = workouts.length;
    return workouts;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Workout List'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
              future: futureWorkouts,
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
                        title: Text(snapshot.data[index].workoutName),
                        //value: snapshot.data[index].isChecked,
                        onTap: () {
                          /*setState(() {
                            snapshot.data[index].isChecked = ;
                          });*/
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
                //_alert(context);
                Navigator.pop(context);
              } else {
                Navigator.pop(context);
                _currentProgress = 0;
                SharedPreferencesHelper.setCurrentProgress(_currentProgress);
                progressToLevelUp++;
                SharedPreferencesHelper.setProgressToLevelUp(progressToLevelUp);
              }
              if (progressToLevelUp == 3) {
                _userLevel++;
                SharedPreferencesHelper.setUserLevel(_userLevel);
                progressToLevelUp = 0;
                SharedPreferencesHelper.setProgressToLevelUp(progressToLevelUp);
              } else {
                print(progressToLevelUp);
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
