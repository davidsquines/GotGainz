// To parse this JSON data, do
//
//     final exercises = exercisesFromJson(jsonString);

import 'dart:convert';

List<Exercises> exercisesFromJson(String str) => List<Exercises>.from(json.decode(str).map((x) => Exercises.fromJson(x)));

String exercisesToJson(List<Exercises> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Exercises {
  String exerciseName;
  String bodyPart;
  int strength;
  String description;
  String exerciseExample;
  String muscleBody;

  Exercises({
    this.exerciseName,
    this.bodyPart,
    this.strength,
    this.description,
    this.exerciseExample,
    this.muscleBody,
  });

  factory Exercises.fromJson(Map<String, dynamic> json) => Exercises(
    exerciseName: json["exerciseName"],
    bodyPart: json["bodyPart"],
    strength: json["strength"],
    description: json["description"],
    exerciseExample: json["exerciseExample"] == null ? null: json['exerciseExample'],
    muscleBody: json["muscleBody"] == null ? null : json["muscleBody"],
  );

  Map<String, dynamic> toJson() => {
    "exerciseName": exerciseName,
    "bodyPart": bodyPart,
    "strength": strength,
    "description": description,
    "exerciseExample": exerciseExample,
    "muscleBody": muscleBody == null ? null : muscleBody,
  };
}
