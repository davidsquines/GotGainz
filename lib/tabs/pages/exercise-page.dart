import 'package:fitness_app/ui/choice-button.dart';
import 'package:flutter/material.dart';

import 'package:fitness_app/pages/exercise-list.dart';
import 'package:fitness_app/pages/workout-plan.dart';

class ExercisePage extends StatefulWidget {
  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  Text _mainText({String text}) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 60.0,
      ),
    );
  }

  Text _subText({String text}) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.orange,
          fontStyle: FontStyle.italic,
          fontSize: 30.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      _mainText(text: 'Stay'),
                      _subText(text: 'Positive,'),
                      _mainText(text: 'Work'),
                      _subText(text: 'Hard,'),
                      _mainText(text: 'Make It'),
                      _subText(text: 'Happen.'),
                    ],
                  ),
                  SizedBox(height: 105.0),
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
