import 'package:flutter/material.dart';

import 'package:fitness_app/pages/workout-list.dart';
import 'package:fitness_app/pages/workout-plan.dart';

class ExercisePage extends StatefulWidget {
  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              //male button
              minWidth: 200.0,
              height: 50.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WorkoutPlan(),
                    ),
                  );
                },
                child: Text('Continue your workout plan'),
                shape: RoundedRectangleBorder(),
                color: Colors.lightBlueAccent, //TODO: Pick a Color
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ButtonTheme(
              //female button
              minWidth: 200.0,
              height: 50.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WorkoutList(),
                    ),
                  );
                },
                child: Text('Show all workouts'),
                shape: RoundedRectangleBorder(),
                color: Colors.lightBlueAccent, //TODO: Pick a Color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
