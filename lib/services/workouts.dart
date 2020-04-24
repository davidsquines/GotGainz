import 'dart:convert';

List<Workouts> workoutsFromJson(String str) =>
    List<Workouts>.from(json.decode(str).map((x) => Workouts.fromJson(x)));

String workoutsToJson(List<Workouts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Workouts {
  String workoutName;
  String description;
  List<WorkoutInfo> exerciseInfo;
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

  static List<WorkoutInfo> parseExerciseInfo(workoutJson) {
    var list = workoutJson['exerciseInfo'] as List;
    List<WorkoutInfo> exerciseInfoList =
        list.map((data) => WorkoutInfo.fromJson(data)).toList();
    return exerciseInfoList;
  }

  Map<String, dynamic> toJson() => {
        "workoutName": workoutName,
        "exerciseInfo": List<dynamic>.from(exerciseInfo.map((x) => x.toJson())),
      };
}

class WorkoutInfo {
  String exerciseName;
  int reps;
  int sets;
  int get getReps => reps;
  WorkoutInfo({
    this.exerciseName,
    this.reps,
    this.sets,
  });

  factory WorkoutInfo.fromJson(Map<String, dynamic> json) => WorkoutInfo(
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
