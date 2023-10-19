import 'dart:io';
import 'package:first_test/models/UserModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class DBTables
{
  static const String Users = "Users";
}

String _usertable = 'CREATE TABLE ${DBTables.Users} (Id INTEGER PRIMARY KEY AUTOINCREMENT, FirstName TEXT, LastName TEXT, Job TEXT DEFAULT "watcher", Description TEXT DEFAULT "this is just a discription for a watcher", Phone Text, Email TEXT, Password Text, Image TEXT DEFAULT "default", Liked INTEGER DEFAULT 0)';

class DbHelper
{
  static DbHelper? dbHelper;
  static Database? _database;
  DbHelper._createInstance();
  factory DbHelper()
  {
    dbHelper ??= DbHelper._createInstance();
    return dbHelper as DbHelper;
  }

  Future<Database> get database async
  {
    _database ??= await _initializedDatabase();
    return _database as Database;
  }

  Future<Database> _initializedDatabase() async {
    int dbVersion =1;
    // Android/data/project_name/files
    final dbFolder = await getExternalStorageDirectory();
    // Android/data/project_name/files/Database
    final dbPath = p.join(dbFolder!.path, "Database");
    Directory dbFolderDir = await Directory(dbPath).create(recursive: true);

    // Android/data/project_name/files/Database/school.db
    final file = File(p.join(dbFolderDir.path, 'm.db'));
    var schoolDB = await openDatabase(
      file.path,
      version: dbVersion,
      onCreate: (db, version)
      {
        db.execute(_usertable);
      },
      onDowngrade: onDatabaseDowngradeDelete,

    );
    return schoolDB;
  }

  Future<int> add_user(String tbl,Map<String, dynamic> obj)async
  {
    try
    {
      var db = await database;
      var result = db.insert(tbl, obj);
      return result;
    }

    catch(e)
    {
      return 0;
    }
  }

  Future<List<Map<String, dynamic>>> get_users(String tbl)async
  {
    var db = await database;
    var result = db.query(tbl);
    return result;
  }

  Future<int> delete_user(String tbl , Object pkValue, {String pkName = 'id'})async
  {
    try
    {
      Database db = await database;
      var result = await db.delete(tbl, where:'$pkName = ?', whereArgs:[pkValue]);
      return result;
    }

    catch(e)
    {
      return 0;
    }
  }


  Future<int> update_user(String tbl,Map<String, dynamic> obj, {String pkName = "id"})async
  {
    try
    {
      Database db = await database;
      var pkValue = obj[pkName];
      if(pkValue != null)
      {
        var result = db.update(tbl, obj, where: '$pkName = ?', whereArgs: [pkValue], conflictAlgorithm: ConflictAlgorithm.ignore);
        return result;
      }
      return 0;
    }
    catch(e)
    {
      return 0;
    }
  }


}