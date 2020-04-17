import 'package:fitness_app/databases/exercise-database-helper.dart';

class Exercises {
  int id;
  String exercise_name;
  String body_part;
  int strength;
  int hypertrophy;
  int cardio;

  Exercises();

  //Exercises(this.id, this.exercise_name, this.body_part, this.strength,
      //this.hypertrophy, this.cardio);

  //convert a exercise object into a map object
  Map<String, dynamic> toMap() {

    var map = new Map<String, dynamic>();
      map["id"] = id;
      map['exercise_name']=  exercise_name;
      map['body_part']=  body_part;
      map['strength']=  strength;
      map['hypertrophy']=  hypertrophy;
      map['cardio']=  cardio;
    return map;
  }

  Exercises.fromMap(Map<String,dynamic> map){
    Exercises exercise = new Exercises();
    exercise.id = map['id'];
    exercise.exercise_name = map['exercise_name'];
    exercise.body_part = map[body_part];
    exercise.strength = map['stregnth'];
    exercise.hypertrophy = map['hypertrohpy'];
    exercise.cardio = map['cardio'];
}




}
