import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fitness_app/services/exercises.dart';
import 'package:fitness_app/pages/workout-details-page.dart';
import 'package:fitness_app/services/shared-pref-helper.dart';

class WorkoutPlan extends StatefulWidget {
  @override
  _WorkoutPlanState createState() => _WorkoutPlanState();
}

class _WorkoutPlanState extends State<WorkoutPlan> {
  SharedPreferences prefs;

  String motivation;
  String apiLink = '';

  @override
  void initState() {
    super.initState();
    _init();
    setData();
  }

  void _init() async {
    prefs = await SharedPreferences.getInstance();
  }

  void setData() {
    SharedPreferencesHelper.getMotivation(prefs).then(
      (motivation) {
        setState(
          () {
            this.motivation = motivation;
            if (motivation == 'I want to gain strength') {
              apiLink =
                  'http://www.json-generator.com/api/json/get/cfzyZlABqq?indent=2'; //TODO: Change this link this a different one that contains a premade strength workout
            } else if (motivation == 'I want to lose weight') {
              apiLink =
                  'http://www.json-generator.com/api/json/get/cqeKauYdCG?indent=2'; //TODO: Change this link this a different one that contains a premade cardio workout
            } else {
              apiLink =
                  'http://www.json-generator.com/api/json/get/bTNIKaWSqa?indent=2'; //default list
            }
          },
        );
      },
    );
  }

  Future<List<Exercises>> _getExercises() async {
    var data = await http.get(apiLink);
    var jsonData = json.decode(data.body);

    List<Exercises> exercises = [];

    for (var type in jsonData) {
      Exercises ex = Exercises(
          type['id'],
          type[
              'exercise_name'], //TODO: when making your new JSON, please fix this to camelCase
          type['body_part'], //TODO: ^
          type['strength'],
          type['hypertrphy'],
          type['cardio']);
      String a = ex.bodyPart;
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
