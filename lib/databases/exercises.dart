import 'package:fitness_app/databases/exercise-database-helper.dart';

class Exercises {
  int id;
  String exercise_name;
  String body_part;
  int strength;
  int hypertrophy;
  int cardio;


  Exercises(this.id, this.exercise_name, this.body_part, this.strength,
      this.hypertrophy, this.cardio);

  //convert a exercise object into a map object
  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      ExerciseDatabaseHelper.columnExerciseName: exercise_name,
      ExerciseDatabaseHelper.columnBodyPart: body_part,
      ExerciseDatabaseHelper.columnStrength: strength,
      ExerciseDatabaseHelper.columnHypertrophy: hypertrophy,
      ExerciseDatabaseHelper.columnCardio: cardio
    };
    return map;
  }

  factory Exercises.fromMap(Map<String,dynamic> map){
    Exercises exercise = new Exercises(0,"","",0,0,0);
    exercise.id = map[ExerciseDatabaseHelper.columnId];
    exercise.exercise_name = map[ExerciseDatabaseHelper.columnExerciseName];
    exercise.body_part = map[ExerciseDatabaseHelper.columnBodyPart];
    exercise.strength = map[ExerciseDatabaseHelper.columnStrength] ;
    exercise.hypertrophy = map[ExerciseDatabaseHelper.columnHypertrophy];
    exercise.cardio = map[ExerciseDatabaseHelper.columnCardio];
    return exercise;
}




}
