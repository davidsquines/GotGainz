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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                  child: Text(
                    'Based on your entered data, you have been assigned the $_plan plan. ',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.green,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
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
