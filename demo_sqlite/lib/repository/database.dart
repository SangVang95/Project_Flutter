import 'dart:io';
import 'package:demo_sqlite/model/dog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {

  DBProvider._();

  // Singleton
  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database  async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initDB();
      return _database;
    }
  }

  initDB() async {
    Directory doccumentDirectory = await getApplicationDocumentsDirectory();
    String path = join(doccumentDirectory.path, "DogDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {

    }, onCreate: (Database db, int version) async {
       await db.execute('CREATE TABLE Dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)');
    });

  }

  // INSERT
  // use normally
  newDog(Dog newDog) async {
    final db = await database;
    var res = await db.insert("Dogs", newDog.toMap());
    return res;
  }

  // use Bigest ID
//  newDog(Dog newDog) async {
//    final db = await database;
//    //get the biggest id in the table
//    var table = await db.rawQuery('SELECT MAX(id)+1 as id FROM Dogs');
//    int id = table.first['id'];
//    //insert to the table using the new id
//    var raw = await db.rawInsert(
//        "INSERT Into Client (id, name, age)"
//            " VALUES (?,?,?)",
//        [id, newDog.name, newDog.age]
//    );
//    return raw;
//  }


  // GET
  getDog(int id) async {
    final db = await database;
    var res = await db.query("Dogs", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Dog.fromMap(res.first) : Null;
  }

  getAlldog() async {
    final db = await database;
    var res = await db.query("Dogs");
    List<Dog> list = res.isNotEmpty ? res.map((e) => Dog.fromMap(e)).toList() : [];
    return list;
  }

  // UPDATE
  updateDog(Dog newDog) async {
    final db = await database;
    var res = await db.update("Dogs", newDog.toMap(), where: "id = ?", whereArgs: [newDog.id]);
    return res;
  }

  //DELETE
  deleteDog(int id) async {
    final db = await database;
    await db.delete("Dogs", where: "id = ?",whereArgs: [id]);

  }

  // DELETE ALL DOG
  deleteAllDog() async {
    final db =  await database;
    db.rawDelete("Delete * from Dogs");
  }
}

