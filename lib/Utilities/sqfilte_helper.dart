import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:store/data/models/user.dart';

class SqliteDbHelper{
  // Database's name
  static const _databaseName = 'shopping.db';
  // Database's version
  static const _databaseVersion = 1;

  final String usersTable = "CREATE TABLE users(id Integer PRIMARY KEY AutoIncrement,firstName TEXT NOT NULL,lastName TEXT NOT NULL,phoneNumber TEXT NOT NULL,address TEXT NOT NULL,email TEXT NOT NULL, password TEXT NOT NULL)";
  final String cartTable = "CREATE TABLE cart(id INTEGER PRIMARY KEY, name TEXT )";
  final String productTable = "CREATE TABLE product(id INTEGER PRIMARY KEY,title TEXT NOT NULL, description TEXT NOT NULL, images TEXT, colors TEXT, rating REAL, price REAL, isFavourite INTEGER, isPopular INTEGER)";

  static final SqliteDbHelper _sqliteDbHelper =  SqliteDbHelper._internal();

  // create private constructor called internal
  SqliteDbHelper._internal();
  // use factory keyword to deal with only one object from SqliteDBHelper class
  factory SqliteDbHelper(){
    return _sqliteDbHelper;
  }


  // only have a single app-wide reference to the database
  static Database? _db;
  // get method that check if the database object is null will call _openDb method to initialize the database and return the object represents it
  Future<Database> get db async => _db ??= await _openDb();

  // Method to open the database if it exists or create it if it doesn't
  _openDb () async{
    /* openDatabase method takes 3 parameters:
       First Parameter: database's path
       Second Parameter is onCreate is a function will execute if the database not found in the specified path or there is a new version
       Third parameter is database version
     */
    return await openDatabase(
        join(await getDatabasesPath(),_databaseName),
        onCreate: _onCreate,
        version: _databaseVersion
    );
  }

  // Method will calls by openDatabase method if the database's path isn't exist or there is a new version of database
  Future _onCreate(Database database,int version) async{


    await database.execute(usersTable);

  }
  // Seed the database with dummy data
  Future seedDatabase() async{
    // Get a reference to the database
    final Database database = await db;
    // Enable foreign key support
    database.execute("PRAGMA foreign_keys = ON;");
    // insert a list and an item to list, items tables
    await database.execute('Insert into users VALUES("ali","ali@gmail.com","123456")');

    List users = await database.rawQuery("Select * from users");
    if (kDebugMode) {
      print(users[0].toString());

    }

  }
  // insert item to the database
  Future<int> insertUser(User user) async{
    final Database database = await db;
    try{
      final List<Map<String,dynamic>> records = await database.query("users",where: "email = ?",whereArgs: [user.email]);
      if(kDebugMode){
        print(records.length);
      }
      if(records.isEmpty){
        int id = await database.insert(
              'users',
              user.toMap(),
              // replace the record with a new one if the id is exist
              conflictAlgorithm: ConflictAlgorithm.replace
          );
        return id;
      }else{
        return -1;
      }
    }catch(e){
      print(e);
    }

    return 0;
  }
  Future<bool> checkIdentity({required email,required password}) async{
    Database database = await _sqliteDbHelper.db;
    final List<Map<String,dynamic>> records = await database.query("users",where: "email = ? and password =?",whereArgs: [email,password]);
    if(records.length ==1){
      return true;
    }
    return false;
  }
  Future<bool> checkEmail({required email}) async{
    Database database = await _sqliteDbHelper.db;
    final List<Map<String,dynamic>> records = await database.query("users",where: "email = ?",whereArgs: [email]);
    if(records.length ==1){
      return true;
    }
    return false;
  }
  Future<int> delete({required int id,required tableName}) async{
    Database database = await _sqliteDbHelper.db;
    int result = await database.delete(tableName,
        where: "id = ?",
        whereArgs: [id]
    );
    return result;
  }
  Future<int> numOfRecords(String tableName) async{
    Database database = await _sqliteDbHelper.db;
    final List<Map<String,dynamic>> records= await database.rawQuery("Select * from $tableName ");
    return records.length;
  }
}