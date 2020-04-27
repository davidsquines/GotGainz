import 'package:fitness_app/pages/workout-details-page.dart';
import 'package:fitness_app/services/shared-pref-helper.dart';
import 'package:fitness_app/services/workouts.dart';
import 'package:fitness_app/ui/done-button.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WorkoutPlan extends StatefulWidget {
  @override
  _WorkoutPlanState createState() => _WorkoutPlanState();
}

class _WorkoutPlanState extends State<WorkoutPlan> {
  Future<List<Workouts>> _futureWorkouts;
  SharedPreferences _prefs;

  String _apiLink = '';
  int _planLength;

  int _currentProgress;
  int _userLevel;
  int _progressToLevelUp;
  String _motivation;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() async {
    _prefs = await SharedPreferences.getInstance();
    SharedPreferencesHelper.getCurrentProgress(_prefs).then((progress) {
      setState(() {
        this._currentProgress = progress;
      });
    });
    SharedPreferencesHelper.getProgressToLevelUp(_prefs)
        .then((progressToLevelUp) {
      setState(() {
        this._progressToLevelUp = progressToLevelUp;
      });
    });
    SharedPreferencesHelper.getMotivation(_prefs).then((motivation) {
      setState(() {
        this._motivation = motivation;
      });
    });
    SharedPreferencesHelper.getUserLevel(_prefs).then((level) {
      setState(() {
        this._userLevel = level;
      });
    });
    _futureWorkouts = _getWorkouts();
  }

  Future<List<Workouts>> _getWorkouts() async {
    await SharedPreferencesHelper.getUserLevel(_prefs).then((level) {
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

  FutureBuilder _listBuilder() {
    return FutureBuilder(
      future: _futureWorkouts,
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
                    MaterialPageRoute(
                      builder: (context) =>
                          WorkoutDetailsPage(snapshot.data[index]),
                    ),
                  );
                  _currentProgress++;
                  SharedPreferencesHelper.setCurrentProgress(_currentProgress);
                },
              );
            },
          );
        }
      },
    );
  }

  void _updateStats() {
    if (_currentProgress < _planLength) {
      Navigator.pop(context);
    } else {
      Navigator.pop(context);
      _currentProgress = 0;
      SharedPreferencesHelper.setCurrentProgress(_currentProgress);
      _progressToLevelUp++;
      SharedPreferencesHelper.setProgressToLevelUp(_progressToLevelUp);
    }
    if (_progressToLevelUp == 2) {
      _userLevel++;
      SharedPreferencesHelper.setUserLevel(_userLevel);
      _progressToLevelUp = 0;
      SharedPreferencesHelper.setProgressToLevelUp(_progressToLevelUp);
    } else {
      print(_progressToLevelUp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout List'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _listBuilder(),
          ),
          DoneButton(
            onPressed: () {
              _updateStats();
            },
          ),
        ],
      ),
    );
  }
}
