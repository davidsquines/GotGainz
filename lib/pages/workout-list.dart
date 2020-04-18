import 'package:fitness_app/pages/workout-details-page.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:fitness_app/services/exercises.dart';

class WorkoutList extends StatefulWidget {
  @override
  _WorkoutListState createState() => _WorkoutListState();
}

class _WorkoutListState extends State<WorkoutList> {
  Future<List<Exercises>> _getExercises() async {
    //var data = await http.get('http://www.json-generator.com/api/json/get/bTNIKaWSqa?indent=2');
    var data = await http.get('http://www.json-generator.com/api/json/get/bVJKimbkzm?indent=2');

    var jsonData = json.decode(data.body);

    List<Exercises> exercises = [];

    for (var type in jsonData) {
      Exercises ex = Exercises(
          type['exerciseName'],
          type[
          'bodyPart'],
          //TODO: when making your new JSON, please fix this to camelCase
          type['strength'], //TODO: ^
          type['description'],
          type['exerciseExample'],
          type['muscleBody']);

      //if (a == ' chest') {
      exercises.add(ex);
      //} //TODO: Fix this to work with filters
    }
    print(exercises.length);
    return exercises;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Exercise List'),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getExercises(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index].exerciseName),
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) =>
                              WorkoutDetailsPage(snapshot.data[index]),
                        ),
                      );
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
