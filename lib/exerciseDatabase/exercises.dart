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
      var map = <String, dynamic>{
        exerciseDatabaseHelper.columnExerciseName: exercise_name,
        exerciseDatabaseHelper.columnBodyPart: body_part,
        exerciseDatabaseHelper.columnStrength: strength,
        exerciseDatabaseHelper.columnHypertrophy: hypertrophy,
        exerciseDatabaseHelper.columnCardio: cardio
      };
      if(id != null){
        map[exerciseDatabaseHelper.columnId] = id;
      }
      return map;
    }



    Exercises.fromMap(Map<String, dynamic> map){
      id = map[exerciseDatabaseHelper.columnId];
      exercise_name = map[exerciseDatabaseHelper.columnExerciseName];
      body_part = map[exerciseDatabaseHelper.columnBodyPart];
      strength = map[exerciseDatabaseHelper.columnStrength] ;
      hypertrophy = map[exerciseDatabaseHelper.columnHypertrophy];
      cardio = map[exerciseDatabaseHelper.columnCardio];
    }



}