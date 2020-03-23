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
  PageController controller;
  SharedPreferences prefs;

  String _firstName;
  String _lastName;
  String _gender;
  String _motivation;
  String _height;
  String _weight;
  String _experience;

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
        _motivation = motivation;
      });
    });
    SharedPreferencesHelper.getHeight(prefs).then((height) {
      setState(() {
        _height = height;
      });
    });
    SharedPreferencesHelper.getWeight(prefs).then((weight) {
      setState(() {
        _weight = weight;
      });
    });
    SharedPreferencesHelper.getExperience(prefs).then((experience) {
      setState(() {
        _experience = experience;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          plan(),
          nextButton(context),
        ],
      ),
    );
  }

  Widget plan() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Here is the best workout plan for you...',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
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
          ),
        ),
      ),
    );
  }

  Widget nextButton(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: AlignmentDirectional.bottomEnd,
        child: Container(
          margin: EdgeInsets.only(right: 16, bottom: 16),
          child: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            heroTag: 'nextButton',
            onPressed: () {
              SharedPreferencesHelper.setOnBoardingStatus(true, prefs);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Tabs()),
                (Route<dynamic> route) => false,
              );
            },
            shape: CircleBorder(),
            child: Icon(Icons.arrow_forward),
          ),
        ),
      ),
    );
  }
}
