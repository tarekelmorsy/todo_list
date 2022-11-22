

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb{
  static Database? _db;
  Future<Database?> get db async{
    if(_db==null){
      _db=await intialDb();
      return _db;
    }else{
      return _db;
    }
  }
  intialDb()async{

    String databasePath= await getDatabasesPath();
    String path=join(databasePath,'todolist.db');
    Database myDataBase=await openDatabase(path,onCreate:_onCreate,version: 1);
    return myDataBase;
  }

  _onCreate(Database db,int version)async{
    await db.execute(
        'CREATE TABLE "todolist" (id INTEGER PRIMARY KEY AUTOINCREMENT, notes TEXT)');
    print("create database and table");

  }
  readData(String sql)async{
    Database? mydb=await db;
    List<Map> response=await mydb!.rawQuery(sql);
    return response;
  }
  insertData(String sql)async{
    Database? mydb=await db;
    int response=await mydb!.rawInsert(sql);
    return response;
  }
  updateData(String sql)async{
    Database? mydb=await db;
    int  response=await mydb!.rawUpdate(sql);
    return response;
  }
  deleteData(String sql)async{
    Database? mydb=await db;
   int response=await mydb!.rawDelete(sql);
    return response;
  }
}