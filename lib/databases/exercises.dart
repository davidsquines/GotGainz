import 'package:fitness_app/databases/exercise-database-helper.dart';

class UserInfo {
  int id;
  String exercise_name;
  String body_part;
  int strength;
  int hypertrophy;
  int cardio;

  UserInfo(this.id, this.exercise_name, this.body_part, this.strength,
      this.hypertrophy, this.cardio);

  UserInfo.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    exercise_name = map['exercise_name'];
    body_part = map['body_part'];
    strength = map['strength'];
    hypertrophy = map['hypertrphy'];
    cardio = map['cardio'];
  }
}
