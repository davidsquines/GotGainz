import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:fitness_app/services/exercises.dart';
import 'package:fitness_app/pages/exercise-details-page.dart';
import 'package:fitness_app/services/drop-down-builder.dart';

class WorkoutList extends StatefulWidget {
  @override
  _WorkoutListState createState() => _WorkoutListState();
}

class _WorkoutListState extends State<WorkoutList> {
  String _filterChoice = 'All';
  String _filterLocation = 'All';

  Future<List<Exercises>> _getExercises(String choice) async {
    var data = await http.get(
        'https://raw.githubusercontent.com/tonynguyen98/Fake-JSON-Server/master/excerciseList.json');

    List<Exercises> exercises;
    exercises = (json.decode(data.body) as List)
        .map((i) => Exercises.fromJson(i))
        .toList();
    List<Exercises> finalExerciseList = [];

    for (var type in exercises) {
      String _bodyPart = type.bodyPart;
      int _workoutType = type.strength;
      if (_filterChoice != 'All') {
        if (_filterChoice == '1' || _filterChoice == '0') {
          if (_workoutType == int.parse(_filterChoice)) {
            finalExerciseList.add(type);
          }
        } else {
          if (_bodyPart == _filterChoice) {
            finalExerciseList.add(type);
          }
        }
      } else {
        finalExerciseList.add(type);
      }
    }

    print(finalExerciseList.length);
    return finalExerciseList;
  }

  void choiceAction(String choice) async {
    _filterLocation = choice;
    setState(
      () {
        if (choice == 'Strength') {
          _filterChoice = 1.toString();
        } else if (choice == 'Calories') {
          _filterChoice = 0.toString();
        } else {
          _filterChoice = choice;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Exercise List'),
        actions: <Widget>[
          Center(
            child: Text(
              _filterLocation,
            ),
          ),
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
          future: _getExercises(_filterChoice),
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
                            builder: (context) => ExerciseDetailsPage(
                              snapshot.data[index],
                            ),
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
