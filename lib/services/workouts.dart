import 'dart:convert';

List<Workouts> workoutsFromJson(String str) => List<Workouts>.from(json.decode(str).map((x) => Workouts.fromJson(x)));

String workoutsToJson(List<Workouts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Workouts {
  String workoutName;
  String description;
  List<ExerciseInfo> exerciseInfo;
  Workouts({
    this.workoutName,
    this.description,
    this.exerciseInfo,

  });

  factory Workouts.fromJson(Map<String, dynamic> json) => Workouts(
    workoutName: json["workoutName"],
    description: json['description'],
      exerciseInfo: parseExerciseInfo(json),
  );

  static List<ExerciseInfo> parseExerciseInfo(workoutJson) {
    var list = workoutJson['exerciseInfo'] as List;
    List<ExerciseInfo> exerciseInfoList =
    list.map((data) => ExerciseInfo.fromJson(data)).toList();
    return exerciseInfoList;
  }

  Map<String, dynamic> toJson() => {
    "workoutName": workoutName,
    "exerciseInfo": List<dynamic>.from(exerciseInfo.map((x) => x.toJson())),
  };
}

class ExerciseInfo {
  String exerciseName;
  int reps;
  int sets;
  int get getReps => reps;
  ExerciseInfo({
    this.exerciseName,
    this.reps,
    this.sets,
  });

  factory ExerciseInfo.fromJson(Map<String, dynamic> json) => ExerciseInfo(
    exerciseName: json["exerciseName"],
    reps: json["reps"],
    sets: json["sets"],
  );

  Map<String, dynamic> toJson() => {
    "exerciseName": exerciseName,
    "reps": reps,
    "sets": sets,
  };
}