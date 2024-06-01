import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

 /* A Store with int keys and Map<String, dynamic> values.
  This Store acts like a persistent map, values of which are Flogs objects converted to Map

 final _postsStore = intMapStoreFactory.store(DBConstants.STORE_NAME);

  Private getter to shorten the amount of code needed to get the
  singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  database instance

 final Future<Database> _db;*/

  final Database _db;
  // Constructor


  DatabaseHelper(this._db);

//  // DB functions:--------------------------------------------------------------

  Future<int> createCourse(var course) async{
    //db.rawInsert('insert into courses value')
    return _db.insert('courses', course.toMap());
  }
  Future<List> allCourses() async{

    //db.rawQuery('select * from courses');
    return _db.query('courses');
  }
  Future<int> delete(int id) async{
    return _db.delete('courses', where: 'id = ?', whereArgs: [id]);
  }
  Future<int> courseUpdate(var course) async{
    return await _db.update('courses', course.toMap(),where: 'id = ?', whereArgs: [course.id]);
  }


}
