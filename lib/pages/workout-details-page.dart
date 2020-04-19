import 'package:flutter/material.dart';

import 'package:fitness_app/services/exercises.dart';

class WorkoutDetailsPage extends StatelessWidget {
  final Exercises exercise;

  WorkoutDetailsPage(this.exercise);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exercise.exerciseName),
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
                      exercise.exerciseExample,
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
                      exercise.muscleBody,
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
                          exercise.description,
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
          ButtonTheme(
            minWidth: double.infinity,
            height: 50.0,
            child: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('I\'m Finished'),
              color: Colors.lightBlue,
            ),
          ),
        ],
      ),
    );
  }
}
