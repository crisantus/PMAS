import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import '../model/installation_model.dart';

class DatabaseHelper {
  //responsible to all the operation
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance; // Singleton Database

  String noteTable = 'note_table';
  String colId = "id";
  String colMeterNumber = "meterNumber";
  String colMeterType = "meterType";
  String colCustomerName = "customerName";
  String colEmailAddress = "emailAddress";
  String colMobileNumber = "mobileNumber";
  String colAccountNumber = "accountNumber";
  String colAreaOffice = "areaOffice";
  String colAddress = "address";
  String colInstallerName = "installerName";
  String colSealNumber = "sealNumber";
  String colRegion = "region";
  String colSupervisorName = "supervisorName";
  String colMeterStatus = "meterStatus";
  String colImgBefore = "imgBefore";
  String colImgAfter = "imgAfter";
  String colDate = "date";
  String colSyncOline = "syncOnline";

  static Database _db;

  Future<Database> get db async {
    //singleton
    if (_db != null) {
      return _db;
    }
    _db = await initializeDatabase();
    return _db;
  }

  DatabaseHelper.internal();

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    // Open/create the database at a given path
    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,'
        ' $colAccountNumber TEXT, '
        ' $colAddress TEXT,'
        ' $colAreaOffice TEXT, '
        ' $colCustomerName TEXT, '
        ' $colEmailAddress TEXT, '
        ' $colImgAfter TEXT, '
        ' $colImgBefore TEXT, '
        ' $colInstallerName TEXT, '
        ' $colMeterNumber TEXT, '
        ' $colMeterType TEXT, '
        ' $colMeterStatus TEXT, '
        ' $colMobileNumber TEXT, '
        ' $colRegion TEXT, '
        ' $colSealNumber TEXT, '
        ' $colSupervisorName TEXT, '
        ' $colSyncOline TEXT, '
        ' $colDate TEXT)');
  }
  //CRUD - CREATE, READ, UPDATE DELETE

  //Insertion
  Future<int> saveItem(InstallationData item) async {
    var dbClient = await db;
    //when ever we save or insert things in our table it returns a number
    int res = await dbClient.insert(noteTable, item.toMap());
    return res;
  }

  //Get Users
  Future<List> getAllItem() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
        "SELECT * FROM $noteTable ORDER BY $colId ASC"); //ASCENDING ODER

    return result.toList();
  }

  //get count of all the users
  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(await dbClient.rawQuery(
        "SELECT COUNT(*) FROM $noteTable")); //select every count of everything in our database
  }

  //what if we want only one user
  Future<InstallationData> getItem(int id) async {
    var dbClient = await db;
    var result = await dbClient
        .rawQuery("SELECT * FROM $noteTable WHERE $colId = $id");
    if (result.length == 0) return null;
    return new InstallationData.fromMapObject(result.first);
  }

  //deleting a user
  Future<int> deleteItem(int id) async {
    var dbClient = await db;

    return await dbClient
        .delete(noteTable, where: "$colId = ? ", whereArgs: [id]);
  }

  //update user
  Future<int> updateItem(InstallationData item) async {
    var dbClient = await db;
    return await dbClient.update(noteTable, item.toMap(),
        where: "$colId = ?", whereArgs: [item.id]);
  }

  //close db
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
