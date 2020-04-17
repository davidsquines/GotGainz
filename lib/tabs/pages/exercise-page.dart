import 'package:fitness_app/databases/exercise-database-helper.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fitness_app/databases/exercises.dart';

class ExercisePage extends StatelessWidget {

  ExerciseDatabaseHelper db = new ExerciseDatabaseHelper();


  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      home: Scaffold(
        body: FutureBuilder<List>(
          future: ExerciseDatabaseHelper.instance.getAllExercise(),
          builder:
              (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int position) {
                  Exercises exercise = snapshot.data[position];
                  return Card(
                    child: ListTile(
                      title: Text(exercise.exercise_name)

                    ),
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
}
