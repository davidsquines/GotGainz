import 'package:fitness_app/ui/alert-dialog.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/services/workouts.dart';
import 'package:fitness_app/services/shared-pref-helper.dart';

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
                          widget.workout.description,
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
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
