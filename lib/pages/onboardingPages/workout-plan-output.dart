import 'package:fitness_app/ui/next-button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:fitness_app/tabs/tabs.dart';
import 'package:fitness_app/services/shared-pref-helper.dart';

class WorkoutPlanOutput extends StatefulWidget {
  @override
  _WorkoutPlanOutputState createState() => _WorkoutPlanOutputState();
}

class _WorkoutPlanOutputState extends State<WorkoutPlanOutput> {
  SharedPreferences prefs;

  String _firstName;
  String _lastName;
  String _gender;
  String _motivation;
  String _height;
  String _weight;
  String _experience;
  String _plan;

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
    SharedPreferencesHelper.getFirstName(prefs).then((firstName) {
      setState(() {
        this._firstName = firstName;
      });
    });
    SharedPreferencesHelper.getLastName(prefs).then((lastName) {
      setState(() {
        this._lastName = lastName;
      });
    });
    SharedPreferencesHelper.getGender(prefs).then((gender) {
      setState(() {
        this._gender = gender;
      });
    });
    SharedPreferencesHelper.getMotivation(prefs).then((motivation) {
      setState(() {
        this._motivation = motivation;
        if (motivation == 'I want to gain strength') {
          _plan = 'swole';
        } else if (motivation == 'I want to lose weight') {
          _plan = 'slim';
        } else {
          _plan = 'ERROR';
        }
      });
    });
    SharedPreferencesHelper.getHeight(prefs).then((height) {
      setState(() {
        this._height = height;
      });
    });
    SharedPreferencesHelper.getWeight(prefs).then((weight) {
      setState(() {
        this._weight = weight;
      });
    });
    SharedPreferencesHelper.getExperience(prefs).then((experience) {
      setState(() {
        this._experience = experience;
      });
    });
  }

  void setInitValues() {
    int beginner = 0;
    int normal = 10;
    int pro = 20;
    int error = 9999;
    SharedPreferencesHelper.setOnBoardingStatus(true, prefs);
    SharedPreferencesHelper.setUserLevel(1);
    SharedPreferencesHelper.setCurrentProgress(0);
    SharedPreferencesHelper.setProgressToLevelUp(0);
    if (_experience == 'I have no gym experience') {
      SharedPreferencesHelper.setChestLevel(beginner);
      SharedPreferencesHelper.setBackLevel(beginner);
      SharedPreferencesHelper.setArmsLevel(beginner);
      SharedPreferencesHelper.setShouldersLevel(beginner);
      SharedPreferencesHelper.setLegsLevel(beginner);
      SharedPreferencesHelper.setStrengthLevel(beginner);
      SharedPreferencesHelper.setCalorieLevel(beginner);
    } else if (_experience == 'I have some gym experience') {
      SharedPreferencesHelper.setChestLevel(normal);
      SharedPreferencesHelper.setBackLevel(normal);
      SharedPreferencesHelper.setArmsLevel(normal);
      SharedPreferencesHelper.setShouldersLevel(normal);
      SharedPreferencesHelper.setLegsLevel(normal);
      SharedPreferencesHelper.setStrengthLevel(normal);
      SharedPreferencesHelper.setCalorieLevel(normal);
    } else if (_experience == 'I have gym experience') {
      SharedPreferencesHelper.setChestLevel(pro);
      SharedPreferencesHelper.setBackLevel(pro);
      SharedPreferencesHelper.setArmsLevel(pro);
      SharedPreferencesHelper.setShouldersLevel(pro);
      SharedPreferencesHelper.setLegsLevel(pro);
      SharedPreferencesHelper.setStrengthLevel(pro);
      SharedPreferencesHelper.setCalorieLevel(pro);
    } else {
      SharedPreferencesHelper.setChestLevel(error);
      SharedPreferencesHelper.setBackLevel(error);
      SharedPreferencesHelper.setArmsLevel(error);
      SharedPreferencesHelper.setShouldersLevel(error);
      SharedPreferencesHelper.setLegsLevel(error);
      SharedPreferencesHelper.setStrengthLevel(error);
      SharedPreferencesHelper.setCalorieLevel(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0.0,
      ),
      body: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(24.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Here is the information you entered:',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.lightBlue,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(_firstName),
                            Text(_lastName),
                            Text(_gender),
                            Text(_motivation),
                            Text(_height),
                            Text(_weight),
                            Text(_experience),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Based on your entered data, you have been assigned the $_plan plan. ',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.green,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: NextButton(
                      onPressed: () {
                        setInitValues();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Tabs()),
                          (Route<dynamic> route) => false,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
