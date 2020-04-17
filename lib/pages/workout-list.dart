import 'package:flutter/material.dart';
import 'package:fitness_app/databases/exercise-database-helper.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:fitness_app/databases/exercises.dart';

class WorkoutList extends StatefulWidget {
  @override
  _WorkoutListState createState() => _WorkoutListState();
}

class _WorkoutListState extends State<WorkoutList> {
  @override
  ExerciseDatabaseHelper db = new ExerciseDatabaseHelper();
  List<Exercises> ex = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder<List<Exercises>>(
          future: db.getAllExercise(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int position) {
                  Exercises exercise = snapshot.data[position];
                  return Card(
                    child: ListTile(title: Text(exercise.exercise_name)),
                  );
                },
              );
            } else {
              return Center(child: Text('Still Broken'));
            }
          },
        ),
      ),
    );
  }

  void _queryAll() async {
    final allRows = await db.getAllExercise();
    ex.clear();
    allRows.forEach((row) => ex.add(row));
  }
}
