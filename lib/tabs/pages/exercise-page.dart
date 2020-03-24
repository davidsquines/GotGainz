import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fitness_app/databases/exercise-database-helper.dart';
import 'package:fitness_app/databases/exercises.dart';

class ExercisePage extends StatelessWidget {
  /*
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green[300],
        body: Center(
          child: FutureBuilder(
            builder: (context, snapshot) {
              var showData = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    title: Text(showData[index]['exercise_name']),
                    subtitle: Text(showData[index]['body_part']),
                  );
                },
                itemCount: showData.length,
              );
            },
            future: DefaultAssetBundle.of(context)
                .loadString("assets/exerciseList.json"),
          ),
        ),
      ),
    );
  }

   */

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exercise Database")),
      /*
      body: FutureBuilder<List<Exercises>>(
        future: exerciseDatabaseHelper.instance.getAllExercise(),
        initialData: List(),
        builder: (BuildContext context,
            AsyncSnapshot<List<Exercises>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Exercises item = snapshot.data[index];
                return Card(
                    child: ListTile(
                        title: Text(item.exercise_name),
                        leading: Text(item.body_part)
                    ),
                );
              },
            );
          }


*/
      body: FutureBuilder<List<Exercises>>(
        future: exerciseDatabaseHelper.instance.getAllExercise(),
        initialData: List(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Exercises>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int position) {
                Exercises exercise = snapshot.data[position];
                return Card(
                  child: ListTile(
                    title: Text(exercise.exercise_name),
                    subtitle: Text(exercise.body_part),
                  ),
                );
              },
            );
          } else {}
        },
      ),
    );
  }
}
