import 'package:fitness_app/exerciseDatabase/exerciseDatabaseHelper.dart';

class Exercises{
    int id;
    String exercise_name;
    String body_part;
    int strength;
    int hypertrophy;
    int cardio;


    Exercises(this.id, this.exercise_name,  this. body_part, this.strength,
        this.hypertrophy, this.cardio);

    //convert a exercise object into a map object
    Map<String, dynamic> toMap(){
      var map = Map<String, dynamic>();
      if(id != null){
        map['id'] = id;
      }
      map['id'] = id;
      map['exercise_name'] = exercise_name;
      map['body_part'] = body_part;
      map['strength'] = strength;
      map['hypertrophy'] = hypertrophy;
      map['cardio'] = cardio;
      return map;
    }



    Exercises.fromMap(Map<String, dynamic> map){
      id = map['id'];
      exercise_name = map['exercise_name'];
      body_part = map['body_part'];
      strength = map['strength'];
      hypertrophy = map['hypertrphy'];
      cardio = map['cardio'];
    }



}