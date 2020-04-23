
import 'package:flutter/material.dart';
import 'package:fitness_app/services/workouts.dart';
class WorkoutDetailsPage extends StatefulWidget {
  final Workouts workout;

  WorkoutDetailsPage(
      this.workout,
      );

  @override
  _WorkoutDetailsPageState createState() => _WorkoutDetailsPageState();
}


class _WorkoutDetailsPageState extends State<WorkoutDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workout.workoutName),
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
                      itemCount: widget.workout.exerciseInfo == null ? 0 : widget.workout.exerciseInfo.length,
                      itemBuilder: (BuildContext context, int i) {
                        return new ListTile(
                          title: new Text(widget.workout.exerciseInfo.elementAt(i).exerciseName),
                          subtitle: new Text('Sets = ' + widget.workout.exerciseInfo.elementAt(i).sets.toString() + ' x Reps = ' + widget.workout.exerciseInfo.elementAt(i).reps.toString()),
                        );
                      }
                    ),

                  )
                ],
              ),
            ),
          ],

      ),
        /*
        body:
        new ListView.builder(
            itemCount: widget.workout.exerciseInfo == null ? 0 : widget.workout.exerciseInfo.length,
            itemBuilder: (BuildContext context, int i) {
              return new ListTile(
                title: new Text(widget.workout.exerciseInfo.elementAt(i).exerciseName),
                subtitle: new Text('Sets = ' + widget.workout.exerciseInfo.elementAt(i).sets.toString() + ' x Reps = ' + widget.workout.exerciseInfo.elementAt(i).reps.toString()),
              );
            }
        )
    */


      /*
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
                      widget.workout.exerciseInfo.elementAt(1).reps.toString(),
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
                      widget.workout.exerciseInfo.elementAt(1).sets.toString(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          MaterialButton(
            minWidth: double.infinity,
            height: 50.0,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'I\'m Done'.toUpperCase(),
            ),
            color: Colors.lightBlue,
            textColor: Colors.white,
          ),
        ],
      ),
      */
    );
  }
}
