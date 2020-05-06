import 'dart:io';
import '../models/patiant.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
class DB {

  static DB _dbHelper ;
  static Database _database;

  String table = 'covid19_macA_table';
  String colId = 'id';
  String colMac = 'mac_address';
  String colSeconds = 'seconds';
  String colDate = 'date';
  String colSick = 'sick';

  DB._createInstance();

  factory DB() {

    if (_dbHelper == null) {
      _dbHelper = DB._createInstance();
    }
    return _dbHelper;
  }
  Future<Database> get database async {

    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'covid19.db';

    // Open/create the database at a given path
    var covidDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return covidDatabase;
  }


 //creatre the table
  void _createDb(Database db, int newVersion) async {

    await db.execute('CREATE TABLE $table($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colMac TEXT, '
        '$colSeconds INTEGER, $colDate TEXT,$colSick INTEGER)');
    print("table created");
  }
//this function is for fetching the data

  Future<List<Map<String, dynamic>>> getMapList() async {
    Database db = await this.database;


    var result = await db.query(table, orderBy: '$colDate ASC');
    return result;
  }


  Future<int> insert(Patient patient) async {
    Database db = await this.database;
    var result = await db.insert(table, patient.toMap());
    return result;
  }

  //created just in case
  Future<int> delete(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $table WHERE $colId = $id');
    return result;
  }

  Future<int> update(Patient patient) async {
    var db = await this.database;
    var result = await db.update(table, patient.toMap(), where: '$colId = ?', whereArgs: [patient.id]);
    return result;
  }

//this one for calculating the number of people in the app
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $table');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

//thi function will get a list from the map
  Future<List<Patient>> getList() async {

    var todoMapList = await getMapList();

    List<Patient> covidList = List<Patient>();

    for (int i = 0; i < todoMapList.length; i++) {
      covidList.add(Patient.fromMapObject(todoMapList[i]));
     //for testing toDelete
      print(Patient.fromMapObject(todoMapList[i]).date);
    }

    return covidList;
  }




}//DB