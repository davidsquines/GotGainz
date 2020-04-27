import 'package:fitness_app/pages/exercise-details-page.dart';
import 'package:fitness_app/ui/alert-dialog.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/services/workouts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:fitness_app/services/exercises.dart';

class WorkoutDetailsPage extends StatefulWidget {
  final Workouts workout;

  WorkoutDetailsPage(
    this.workout,
  );

  @override
  _WorkoutDetailsPageState createState() => _WorkoutDetailsPageState();
}

class _WorkoutDetailsPageState extends State<WorkoutDetailsPage> {
  int _currentProgress = 0;
  int _planLength;
  List<Exercises> exercises = [];
  String exerciseName;

  @override
  void initState() {
    super.initState();
    _getExercises();
  }

  void _alert(BuildContext context) {
    return ShowAlertDialog(
            cancelButtonToggle: true,
            mainButtonText: 'Continue',
            mainButtonOnPressed: () {
              _currentProgress = 0;
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.pop(context);
            },
            alertTitle: 'WARNING',
            alertContent:
                'You have not finished for today. Your data will NOT be saved.')
        .showAlertDialog(context);
  }

  Future<List<Exercises>> _getExercises() async {
    var data = await http.get(
        'https://raw.githubusercontent.com/tonynguyen98/Fake-JSON-Server/master/excerciseList.json');

    exercises = (json.decode(data.body) as List)
        .map((i) => Exercises.fromJson(i))
        .toList();

    for (var type in exercises) {
      exercises.add(type);
    }
    return exercises;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workout.workoutName),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
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
                Scrollbar(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.workout.description,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.workout.exerciseInfo == null
                        ? 0
                        : widget.workout.exerciseInfo.length,
                    itemBuilder: (BuildContext context, int i) {
                      return CheckboxListTile(
                        title: Text(widget.workout.exerciseInfo
                            .elementAt(i)
                            .exerciseName),
                        subtitle: Text('Sets = ' +
                            widget.workout.exerciseInfo
                                .elementAt(i)
                                .sets
                                .toString() +
                            ' x Reps = ' +
                            widget.workout.exerciseInfo
                                .elementAt(i)
                                .reps
                                .toString()),
                        value:
                            widget.workout.exerciseInfo.elementAt(i).isChecked,
                        onChanged: (value) {
                          _currentProgress++;
                          setState(() {
                            widget.workout.exerciseInfo.elementAt(i).isChecked =
                                true;
                            exercises.forEach((element) {
                              if (widget.workout.exerciseInfo
                                      .elementAt(i)
                                      .exerciseName ==
                                  element.exerciseName) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ExerciseDetailsPage(
                                      element,
                                    ),
                                  ),
                                );
                              }
                            });
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          MaterialButton(
            minWidth: double.infinity,
            height: 50.0,
            onPressed: () {
              _planLength = widget.workout.exerciseInfo.length - 1;
              if (_currentProgress < _planLength) {
                //_alert(context);
                Navigator.pop(context);
              } else {
                Navigator.pop(context);
                _currentProgress = 0;
              }
            },
            child: Text(
              'I\'m Done'.toUpperCase(),
            ),
            color: Colors.lightBlue,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
