import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:fitness_app/databases/exercises.dart';

class WorkoutList extends StatefulWidget {
  @override
  _WorkoutListState createState() => _WorkoutListState();
}

class _WorkoutListState extends State<WorkoutList> {
  Future<List<Exercises>> _getExercises() async {
    var data = await http
        .get("http://www.json-generator.com/api/json/get/bTNIKaWSqa?indent=2");
    var jsonData = json.decode(data.body);

    List<Exercises> exercises = [];

    for (var u in jsonData) {
      Exercises ex = Exercises(u["id"], u["exercise_name"], u["body_part"],
          u["strength"], u["hypertrphy"], u["cardio"]);
      String a = ex.body_part;
      if (a == " chest") {
        exercises.add(ex);
      } //TODO: Fix this to work with filters
    }
    print(exercises.length);
    return exercises;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text("Exercise List")),
      body: Container(
        child: FutureBuilder(
          future: _getExercises(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(child: Text("Loading...")),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index].exercise_name),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  DetailsPage(snapshot.data[index])));
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final Exercises exercise;
  DetailsPage(this.exercise);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(exercise.exercise_name),
    ));
  }
}
