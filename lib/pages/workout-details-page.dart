import 'package:fitness_app/services/exercises.dart';
import 'package:fitness_app/pages/exercise-details-page.dart';
import 'package:fitness_app/ui/alert-dialog.dart';
import 'package:fitness_app/ui/done-button.dart';
import 'package:fitness_app/services/workouts.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  String exerciseName;

  List<Exercises> _exercises = [];

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
    var _data = await http.get(
        'https://raw.githubusercontent.com/tonynguyen98/Fake-JSON-Server/master/excerciseList.json');

    _exercises = (json.decode(_data.body) as List)
        .map((i) => Exercises.fromJson(i))
        .toList();

    for (var type in _exercises) {
      _exercises.add(type);
    }
    return _exercises;
  }

  ListView _listViewBuilder() {
    return ListView.builder(
      itemCount: widget.workout.exerciseInfo == null
          ? 0
          : widget.workout.exerciseInfo.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            widget.workout.exerciseInfo.elementAt(index).exerciseName,
          ),
          subtitle: Text(
            'Sets = ' +
                widget.workout.exerciseInfo.elementAt(index).sets.toString() +
                ' x Reps = ' +
                widget.workout.exerciseInfo.elementAt(index).reps.toString(),
          ),
          trailing: Icon(
            widget.workout.exerciseInfo.elementAt(index).isChecked
                ? Icons.check_box
                : Icons.check_box_outline_blank,
          ),
          onLongPress: () {
            _currentProgress++;
            setState(
              () {
                widget.workout.exerciseInfo.elementAt(index).isChecked = true;
                _exercises.forEach(
                  (element) {
                    if (widget.workout.exerciseInfo
                            .elementAt(index)
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
                  },
                );
              },
            );
          },
          onTap: () {
            _currentProgress++;
            setState(() {
              widget.workout.exerciseInfo.elementAt(index).isChecked = true;
            });
          },
        );
      },
    );
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  child: _listViewBuilder(),
                ),
              ],
            ),
          ),
          DoneButton(
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
          ),
        ],
      ),
    );
  }
}
