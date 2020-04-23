import 'package:fitness_app/services/shared-pref-helper.dart';
import 'package:flutter/material.dart';

import 'package:fitness_app/services/exercises.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExerciseDetailsPage extends StatefulWidget {
  final Exercises exercise;

  ExerciseDetailsPage(
    this.exercise,
  );

  @override
  _ExerciseDetailsPageState createState() => _ExerciseDetailsPageState();
}

class _ExerciseDetailsPageState extends State<ExerciseDetailsPage> {
  SharedPreferences prefs;

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

  void updateBodyStrengthLevel() {
    if (widget.exercise.bodyPart == 'Chest') {
      _chestLevel++;
      SharedPreferencesHelper.setChestLevel(_chestLevel);
    } else if (widget.exercise.bodyPart == 'Back') {
      _backLevel++;
      SharedPreferencesHelper.setBackLevel(_backLevel);
    } else if (widget.exercise.bodyPart == 'Arms') {
      _armsLevel++;
      SharedPreferencesHelper.setArmsLevel(_armsLevel);
    } else if (widget.exercise.bodyPart == 'Shoulders') {
      _shouldersLevel++;
      SharedPreferencesHelper.setShouldersLevel(_shouldersLevel);
    } else if (widget.exercise.bodyPart == 'Legs') {
      _legsLevel++;
      SharedPreferencesHelper.setLegsLevel(_legsLevel);
    } else if (widget.exercise.bodyPart == 'Full Body') {
      _chestLevel++;
      SharedPreferencesHelper.setChestLevel(_chestLevel);
      _backLevel++;
      SharedPreferencesHelper.setBackLevel(_backLevel);
      _armsLevel++;
      SharedPreferencesHelper.setArmsLevel(_armsLevel);
      _shouldersLevel++;
      SharedPreferencesHelper.setShouldersLevel(_shouldersLevel);
      _legsLevel++;
      SharedPreferencesHelper.setLegsLevel(_legsLevel);
    } else {
      print('ERROR');
    }
    if (widget.exercise.strength == 1) {
      _strengthLevel++;
      SharedPreferencesHelper.setStrengthLevel(_strengthLevel);
    } else if (widget.exercise.strength == 0) {
      _calorieLevel++;
      SharedPreferencesHelper.setCalorieLevel(_calorieLevel);
    } else {
      print('ERROR');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise.exerciseName),
      ),
      body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Exercise image:',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Image.network(
                      widget.exercise.exerciseExample,
                      height: 150.0,
                      width: 150.0,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Body part worked:',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Image.network(
                      widget.exercise.muscleBody,
                      height: 150.0,
                      width: 150.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    'How to:',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Flexible(
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.exercise.description,
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          MaterialButton(
            minWidth: double.infinity,
            height: 50.0,
            onPressed: () {
              updateBodyStrengthLevel();
              Navigator.pop(context);
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
