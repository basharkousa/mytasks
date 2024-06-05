import 'package:mytasks/src/data/local/datasources/database/constants/db_constants.dart';
import 'package:mytasks/src/data/models/tasksmodels/tasksresponse/task_model.dart';
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

  Future<void> addTaskHistoryQuery(TaskModel task) async {
    await _db.insert(DBConstants.TASK_HISTORY, task.toMapDatabase());
  }

  Future<List<TaskModel>> getTaskHistoryItemsQuery() async {
    final maps = await _db.query(DBConstants.TASK_HISTORY);
    return List.generate(maps.length, (i) => TaskModel.fromMapDataBase(maps[i]));
  }

 /* Future<int> delete(int id) async{
    return _db.delete('example', where: 'id = ?', whereArgs: [id]);
  }
  Future<int> exampleUpdate(var course) async{
    return await _db.update('example', course.toMap(),where: 'id = ?', whereArgs: [example.id]);
  }*/


}
