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
                      'Body part worked:',
                      style: TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.start,
                    ),
                    Image.network(
                      exercise.exerciseExample,
                      height: 100.0,
                      width: 100.0,
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
                    'Description:',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Flexible(
                  child: Text(
                    exercise.description
                        .toUpperCase(), //TODO: Change this when description is implemented
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          /*Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonTheme(
                    //male button
                    minWidth: double.infinity,
                    height: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('I\'m Finished'),
                      shape: RoundedRectangleBorder(),
                      color: Colors.blue, //TODO: Pick a Color
                    ),
                  ),
                ),
              ),
            ),*/
        ],
      ),
    );
  }
}
