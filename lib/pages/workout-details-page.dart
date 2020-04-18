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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Body part:',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Text(
                      exercise.bodyPart.toUpperCase(),
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Image.network(exercise.muscleBody, height: 200, width: 200
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                     Image.network(exercise.exerciseExample,
                       height: 200,
                       width: 200,
                     )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Description:',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Text(
                      exercise.description
                          .toUpperCase(), //TODO: Change this when description is implemented
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ],
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
          ),
        ],
      ),
    );
  }
}
