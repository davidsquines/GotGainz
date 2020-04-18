import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fitness_app/services/shared-pref-helper.dart';

class WorkoutPlan extends StatefulWidget {
  @override
  _WorkoutPlanState createState() => _WorkoutPlanState();
}

class _WorkoutPlanState extends State<WorkoutPlan> {
  SharedPreferences prefs;

  String motivation;
  int _plan;

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
    SharedPreferencesHelper.getMotivation(prefs).then(
      (motivation) {
        setState(
          () {
            this.motivation = motivation;
            if (motivation == 'I want to gain strength') {
              _plan = 0;
            } else if (motivation == 'I want to lose weight') {
              _plan = 1;
            } else {
              _plan = 2;
            }
          },
        );
      },
    );
  }

  Widget customPlan() {
    if (_plan == 0) {
      return Text('Put strength workouts here');
    } else if (_plan == 1) {
      return Text('Put slimming workouts here');
    } else {
      return Text('ERROR');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: customPlan(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonTheme(
                    //male button
                    minWidth: double.infinity,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text('DONE'),
                      shape: RoundedRectangleBorder(),
                      color: Colors.blue, //TODO: Pick a Color
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
