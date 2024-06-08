import 'package:get/get.dart';
import 'package:mytasks/src/data/local/datasources/database/constants/db_constants.dart';
import 'package:sqflite/sqflite.dart';
import '../../data/local/datasources/sharedpref/shared_preference_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AsyncBindings extends Bindings {
  AsyncBindings();

  @override
  Future dependencies() async {
    await Get.putAsync<Database>(() async {
      var databasesPath = await getDatabasesPath();
      //
      String path = '$databasesPath/${DBConstants.DB_NAME}';
      // Delete the database
      // await deleteDatabase(path);
      Database database = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute('''
        CREATE TABLE ${DBConstants.TASK_HISTORY} (
          ${DBConstants.ID} TEXT PRIMARY KEY,
          ${DBConstants.PROJECT_ID} TEXT,
          ${DBConstants.SECTION_ID} TEXT,
          ${DBConstants.CONTENT} TEXT,
          ${DBConstants.DESCRIPTIN} TEXT,
          ${DBConstants.PRIORITY} INTEGER,
          ${DBConstants.CREATED_AT} TEXT,
          ${DBConstants.SPENT_TIME} INTEGER
        )
      ''');
      });

      return database;
    }, permanent: true);

    await Get.putAsync<SharedPreferences>(() async {
      // final prefs = await SharedPreferences.getInstance();
      // await prefs.setString('name', 'Batman');
      return await SharedPreferences.getInstance();
    }, permanent: true);
    await Get.putAsync<SharedPreferenceHelper>(() async {
      return SharedPreferenceHelper(Get.find<SharedPreferences>());
    }, permanent: true);
  }
}
