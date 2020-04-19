import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:fitness_app/services/exercises.dart';
import 'package:fitness_app/pages/workout-details-page.dart';
import 'package:fitness_app/services/drop-down-builder.dart';

class WorkoutList extends StatefulWidget {
  @override
  _WorkoutListState createState() => _WorkoutListState();
}

class _WorkoutListState extends State<WorkoutList> {
  String _bodyChoice = 'All';

  Future<List<Exercises>> _getExercises(String choice) async {
    var data = await http.get(
        'https://raw.githubusercontent.com/tonynguyen98/Fake-JSON-Server/master/excerciseList.json');

    var jsonData = json.decode(data.body);

    List<Exercises> exercises = [];

    for (var type in jsonData) {
      Exercises ex = Exercises(
          type['exerciseName'],
          type['bodyPart'],
          type['strength'],
          type['description'],
          type['exerciseExample'],
          type['muscleBody']);

      String _bodyPart = ex.bodyPart;
      if (_bodyChoice != 'All') {
        if (_bodyPart == _bodyChoice) {
          exercises.add(ex);
        }
      } else {
        exercises.add(ex);
      }
    }

    print(exercises.length);
    return exercises;
  }

  void choiceAction(String choice) async {
    setState(
      () {
        _bodyChoice = choice;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Exercise List'),
        actions: <Widget>[
          PopupMenuButton<String>(
            icon: Icon(Icons.filter_list),
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return DropDownBuilder.choices.map(
                (String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                },
              ).toList();
            },
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future: _getExercises(_bodyChoice),
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
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WorkoutDetailsPage(snapshot.data[index]),
                          ),
                        );
                      });
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
