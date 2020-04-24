import 'package:fitness_app/ui/choice-button.dart';
import 'package:flutter/material.dart';

import 'package:fitness_app/pages/exercise-list.dart';
import 'package:fitness_app/pages/workout-plan.dart';

class ExercisePage extends StatefulWidget {
  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  ChoiceButton(
                    text: 'Continue your workout plan',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkoutPlan(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ChoiceButton(
                    text: 'Show all workouts',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkoutList(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
