import 'package:fitness_app/databases/exercises.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';

class ExerciseDatabaseHelper {
  static final _databaseName = "exercises.db";
  static final _databaseVersion = 1;

  static final table = 'exerciseList';

  static final columnId = 'id';
  static final columnExerciseName = 'exercise_name';
  static final columnBodyPart = 'body_part';
  static final columnStrength = 'strength';
  static final columnHypertrophy = 'hypertrophy';
  static final columnCardio = 'cardio';

  static final ExerciseDatabaseHelper instance =
      new ExerciseDatabaseHelper.internal();
  factory ExerciseDatabaseHelper() => instance;
  // only have a single app-wide reference to the database
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await initDB();
    return _database;
  }

  ExerciseDatabaseHelper.internal();
  // this opens the database (and creates it if it doesn't exist)
  /*
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "exercises.db");
    //if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound)

    ByteData data = await rootBundle.load(join('assets/Databases', 'exercises.db'));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await new File(path).writeAsBytes(bytes);

    var ourDb = await openDatabase(path);
    return ourDb;
  }
   */
  initDB() async {
    /*
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "exercises.db");

    var exists = await databaseExists(path);

    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join("assets", "userExercises.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);
    } else {}

    return await openDatabase(path, readOnly: false);

     */
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "exercises.db");

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "userExercises.db"));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);

    } else {
      print("Opening existing database");
    }
// open the database
    return await openDatabase(path, readOnly: true);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            columnExerciseName TEXT NOT NULL,
            columnBodyPart TEXT NOT NULL,
            columnStrength INTEGER NOT NULL,
            columnHypertrophy INTEGER NOT NULL,
            columnCardio INTEGER NOT NULL
          )
          ''');
  }

  Future<int> insert(Exercises exercise) async {
    Database db = await instance.database;
    return await db.insert(table, {
      'exercise_name': exercise.exercise_name,
      'body_part': exercise.body_part
    });
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List> getAllExercise() async {
    final Database db = await database;
    /*

    var res = await db.query("exerciseList", columns:["exercise_name", "body_part", "strength", "hypertrophy", "cardio"]);
    List<Exercises> list =
    res.isNotEmpty ? res.map((m) => Exercises.toMap(m)).toList() : [];
    return list;
    */

      var result  = await db.query(ExerciseDatabaseHelper.table);
      result.forEach((row) => print(row));
      return result;



  }


/*
  // Queries rows based on the argument received
  //each query searches for the intended argument, and returns a table of all data
  // containing the desired field

  //query for exercise name
  Future<List<Map<String, dynamic>>> queryExerciseNameRows(exercise_name) async {
    Database db = await instance.database;
    return await db.query(table, where: "$columnExerciseName LIKE '%$exercise_name%'");
  }

  //query for exercise by body part
  Future<List<Map<String, dynamic>>> queryBodyPartRows(body_part) async {
    Database db = await instance.database;
    return await db.query(table, where: "$columnBodyPart LIKE '%$body_part%'");
  }

  //query for exercises by strength
  Future<List<Map<String, dynamic>>> queryStrengthRows(strength) async {
    Database db = await instance.database;
    return await db.query(table, where: "$columnStrength LIKE '%$strength%'");
  }

  //query for exercises by hypertrophy
  Future<List<Map<String, dynamic>>> queryHypertrophyRows(hypertrophy) async {
    Database db = await instance.database;
    return await db.query(table, where: "$columnBodyPart LIKE '%$hypertrophy%'");
  }

  //query for exercises by cardio

  Future<List<Map<String, dynamic>>> queryCardioRows(cardio) async {
    Database db = await instance.database;
    return await db.query(table, where: "$columnBodyPart LIKE '%$cardio%'");
  }


  //delete function
  // will only delete based on exercise name
  Future<int> delete(String exercise_name) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnExerciseName = ?', whereArgs: [exercise_name]);
  }
*/

}


