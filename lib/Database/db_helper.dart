import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class DBTables
{
  static const String Users = "Users";
}

String _usertable = 'CREATE TABLE ${DBTables.Users} (Id INTEGER PRIMARY KEY AUTOINCREMENT, FirstName TEXT, LastName TEXT, Job TEXT NULL, Description TEXT NULL, Email TEXT, Password Text, Image TEXT NULL)';


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
    final file = File(p.join(dbFolderDir.path, 'ez.db'));
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

}