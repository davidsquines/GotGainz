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
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      ExerciseDatabaseHelper.columnExerciseName: exercise_name,
      ExerciseDatabaseHelper.columnBodyPart: body_part,
      ExerciseDatabaseHelper.columnStrength: strength,
      ExerciseDatabaseHelper.columnHypertrophy: hypertrophy,
      ExerciseDatabaseHelper.columnCardio: cardio
    };
    if (id != null) {
      map[ExerciseDatabaseHelper.columnId] = id;
    }
    return map;
  }

  Exercises.fromMap(Map<String, dynamic> map) {
    id = map[ExerciseDatabaseHelper.columnId];
    exercise_name = map[ExerciseDatabaseHelper.columnExerciseName];
    body_part = map[ExerciseDatabaseHelper.columnBodyPart];
    strength = map[ExerciseDatabaseHelper.columnStrength];
    hypertrophy = map[ExerciseDatabaseHelper.columnHypertrophy];
    cardio = map[ExerciseDatabaseHelper.columnCardio];
  }
}
