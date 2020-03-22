import 'package:fitness_app/databases/exercises.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ExerciseDatabaseHelper {
  static final _databaseName = "exercises.db";
  static final _databaseVersion = 1;

  static final table =
      'exercises_table'; //TODO: Why is this different from DB browser

  static final columnId = 'id';
  static final columnExerciseName = 'exercise_name';
  static final columnBodyPart = 'body_part';
  static final columnStrength = 'strength';
  static final columnHypertrophy = 'hypertrophy';
  static final columnCardio = 'cardio';

  // make singleton class
  ExerciseDatabaseHelper._privateConstructor();
  static final ExerciseDatabaseHelper instance =
      ExerciseDatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnExerciseName TEXT NOT NULL,
            $columnBodyPart TEXT NOT NULL
            $columnStrength INTEGER NOT NULL,
            $columnHypertrophy INTEGER NOT NULL,
            $columnCardio INTEGER NOT NULL
          )
          ''');
  }

  Future<int> insert(Exercise exercise) async {
    Database db = await instance.database;
    return await db.insert(table, {
      'exercise_name': exercise.exercise_name,
      'body_part': exercise.body_part
    });
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  // Queries rows based on the argument received
  //each query searches for the intended argument, and returns a table of all data
  // containing the desired field

  //query for exercise name
  Future<List<Map<String, dynamic>>> queryExerciseNameRows(
      exercise_name) async {
    Database db = await instance.database;
    return await db.query(table,
        where: "$columnExerciseName LIKE '%$exercise_name%'");
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
    return await db.query(table,
        where: "$columnBodyPart LIKE '%$hypertrophy%'");
  }

  //query for exercises by cardio

  Future<List<Map<String, dynamic>>> queryCardioRows(cardio) async {
    Database db = await instance.database;
    return await db.query(table, where: "$columnBodyPart LIKE '%$cardio%'");
  }

  //delete function
  Future<int> delete(String exercise_name) async {
    Database db = await instance.database;
    return await db.delete(table,
        where: '$columnExerciseName = ?', whereArgs: [exercise_name]);
  }
}
