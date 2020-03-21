import 'package:fitness_app/databases/user-info.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserInfoDatabaseHelper {
  static final _databaseName = "user-info.db";
  static final _databaseVersion = 1;

  static final table = 'UserInfo';

  static final columnLastName = 'lastName';
  static final columnFirstName = 'firstName';
  static final columnGender = 'gender';
  static final columnMotivation = 'motivation';
  static final columnHeight = 'height';
  static final columnWeight = 'weight';
  static final columnExperience = 'experience';

  // make singleton class
  UserInfoDatabaseHelper._privateConstructor();
  static final UserInfoDatabaseHelper instance =
      UserInfoDatabaseHelper._privateConstructor();

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
            $columnLastName TEXT PRIMARY KEY AUTOINCREMENT,
            $columnFirstName TEXT NOT NULL,
            $columnGender INTEGER NOT NULL
            $columnMotivation INTEGER NOT NULL,
            $columnHeight INTEGER NOT NULL,
            $columnWeight INTEGER NOT NULL,
            $columnExperience INTEGER NOT NULL,
          )
          ''');
  }

  Future<int> insert(UserInfo info) async {
    Database db = await instance.database;
    return await db.insert(
      table,
      {
        'lastName': info.lastName,
      },
    );
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

  //query for first name
  Future<List<Map<String, dynamic>>> queryUserInfoNameRows(firstName) async {
    Database db = await instance.database;
    return await db.query(table, where: "$columnFirstName LIKE '%$firstName%'");
  }

  //query for gender
  Future<List<Map<String, dynamic>>> queryGenderRows(gender) async {
    Database db = await instance.database;
    return await db.query(table, where: "$columnGender LIKE '%$gender%'");
  }

  //query for motivation
  Future<List<Map<String, dynamic>>> queryMotivationRows(motivation) async {
    Database db = await instance.database;
    return await db.query(table,
        where: "$columnMotivation LIKE '%$motivation%'");
  }

  //query for height
  Future<List<Map<String, dynamic>>> queryHeightRows(height) async {
    Database db = await instance.database;
    return await db.query(table, where: "$columnGender LIKE '%$height%'");
  }

  //query for weight
  Future<List<Map<String, dynamic>>> queryWeightRows(weight) async {
    Database db = await instance.database;
    return await db.query(table, where: "$columnGender LIKE '%$weight%'");
  }

  //query for experience
  Future<List<Map<String, dynamic>>> queryExperienceRows(experience) async {
    Database db = await instance.database;
    return await db.query(table, where: "$columnGender LIKE '%$experience%'");
  }

  //delete function
  Future<int> delete(String lastName) async {
    Database db = await instance.database;
    return await db
        .delete(table, where: '$columnLastName = ?', whereArgs: [lastName]);
  }
}
