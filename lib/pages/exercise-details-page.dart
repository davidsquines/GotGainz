import 'package:fitness_app/pages/full-image.dart';
import 'package:fitness_app/services/shared-pref-helper.dart';
import 'package:fitness_app/ui/done-button.dart';
import 'package:fitness_app/services/exercises.dart';

import 'package:flutter/material.dart';
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
  SharedPreferences _prefs;

  int _chestLevel;
  int _backLevel;
  int _armsLevel;
  int _shouldersLevel;
  int _legsLevel;
  int _strengthLevel;
  int _weightLossLevel;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() async {
    _prefs = await SharedPreferences.getInstance();
    SharedPreferencesHelper.getChestLevel(_prefs).then((chestLevel) {
      setState(() {
        this._chestLevel = chestLevel;
      });
    });
    SharedPreferencesHelper.getBackLevel(_prefs).then((backLevel) {
      setState(() {
        this._backLevel = backLevel;
      });
    });
    SharedPreferencesHelper.getArmsLevel(_prefs).then((armsLevel) {
      setState(() {
        this._armsLevel = armsLevel;
      });
    });
    SharedPreferencesHelper.getShouldersLevel(_prefs).then((shouldersLevel) {
      setState(() {
        this._shouldersLevel = shouldersLevel;
      });
    });
    SharedPreferencesHelper.getLegsLevel(_prefs).then((legsLevel) {
      setState(() {
        this._legsLevel = legsLevel;
      });
    });
    SharedPreferencesHelper.getStrengthLevel(_prefs).then((strengthLevel) {
      setState(() {
        this._strengthLevel = strengthLevel;
      });
    });
    SharedPreferencesHelper.getWeightLossLevel(_prefs).then((weightLossLevel) {
      setState(() {
        this._weightLossLevel = weightLossLevel;
      });
    });
  }

  void _updateBodyStrengthLevel() {
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
      _weightLossLevel++;
      SharedPreferencesHelper.setWeightLossLevel(_weightLossLevel);
    } else {
      print('ERROR');
    }
  }

  Column _imageStyle(String _text, String _location) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 12.0,
        ),
        Text(
          _text,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.white,
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FullImage(_location))),
              child: Image.network(
                _location,
                height: 150.0,
                width: 150.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _imageBuilder() {
    return Row(
      children: <Widget>[
        Expanded(
            child: _imageStyle(
                'Exercise Image:', widget.exercise.exerciseExample)),
        Expanded(
            child:
                _imageStyle('Body Part Worked:', widget.exercise.muscleBody)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          widget.exercise.exerciseName,
          style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.underline,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      if (widget.exercise.muscleBody != null ||
                          widget.exercise.exerciseExample != null)
                        _imageBuilder(),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text(
                          'Instructions:',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.0),
                        ),
                        color: Colors.orange,
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text(
                            widget.exercise.description,
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            DoneButton(
              onPressed: () {
                _updateBodyStrengthLevel();
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
