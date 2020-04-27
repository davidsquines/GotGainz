import 'package:fitness_app/services/exercises.dart';
import 'package:fitness_app/pages/exercise-details-page.dart';
import 'package:fitness_app/services/drop-down-builder.dart';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class WorkoutList extends StatefulWidget {
  @override
  _WorkoutListState createState() => _WorkoutListState();
}

class _WorkoutListState extends State<WorkoutList> {
  String _filterChoice = 'All';
  String _filterLocation = 'All';

  Future<List<Exercises>> _getExercises(String _choice) async {
    var data = await http.get(
        'https://raw.githubusercontent.com/tonynguyen98/Fake-JSON-Server/master/excerciseList.json');

    List<Exercises> _exercises;
    List<Exercises> _finalExerciseList = [];

    _exercises = (json.decode(data.body) as List)
        .map((i) => Exercises.fromJson(i))
        .toList();

    for (var type in _exercises) {
      String _bodyPart = type.bodyPart;
      int _workoutType = type.strength;
      if (_filterChoice != 'All') {
        if (_filterChoice == '1' || _filterChoice == '0') {
          if (_workoutType == int.parse(_filterChoice)) {
            _finalExerciseList.add(type);
          }
        } else {
          if (_bodyPart == _filterChoice) {
            _finalExerciseList.add(type);
          }
        }
      } else {
        _finalExerciseList.add(type);
      }
    }

    return _finalExerciseList;
  }

  void _filterAction(String _choice) async {
    _filterLocation = _choice;
    setState(
      () {
        if (_choice == 'Strength') {
          _filterChoice = 1.toString();
        } else if (_choice == 'Calories') {
          _filterChoice = 0.toString();
        } else {
          _filterChoice = _choice;
        }
      },
    );
  }

  PopupMenuButton _filterButtonBuilder() {
    return PopupMenuButton<String>(
      icon: Icon(Icons.filter_list),
      onSelected: _filterAction,
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
    );
  }

  FutureBuilder _listBuilder() {
    return FutureBuilder(
      future: _getExercises(_filterChoice),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(snapshot.data[index].exerciseName),
                trailing: Icon(Icons.keyboard_arrow_right),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise List'),
        actions: <Widget>[
          Center(
            child: Text(
              _filterLocation,
            ),
          ),
          _filterButtonBuilder(),
        ],
      ),
      body: Container(
        child: _listBuilder(),
      ),
    );
  }
}
