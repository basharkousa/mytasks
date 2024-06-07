import 'dart:ui';
import 'package:mytasks/src/data/local/datasources/database/database_helper.dart';
import 'package:mytasks/src/data/models/tasksmodels/tasksresponse/task_model.dart';

import '../../data/local/datasources/sharedpref/shared_preference_helper.dart';
import '../../data/models/user/user.dart';

class LocalDataSource {

  final SharedPreferenceHelper _sharedPrefsHelper;
  final DatabaseHelper _databaseHelper;

  LocalDataSource(this._sharedPrefsHelper,this._databaseHelper);


  /* --------------------------------SQL_LITE METHODS------------------------------------- */

  Future<List<TaskModel>> getTaskHistoryList() =>
      _databaseHelper.getTaskHistoryItemsQuery();

  Future<void> addTaskHistoryItem(TaskModel task) =>
      _databaseHelper.addTaskHistoryQuery(task);

  Future<void> clearTaskHistoryList() =>
      _databaseHelper.clearTaskHistoryList();



  /* --------------------------------SHERED_PREFFERNCES METHODES------------------------------------- */


  Future<Locale> get fetchLocale => _sharedPrefsHelper.fetchLocale();

  Future<User> getUser() => _sharedPrefsHelper.getUser();

  Future<void> saveUser(User user) => _sharedPrefsHelper.saveUser(user);

  Future<void> removeUser() => _sharedPrefsHelper.removeUser();

  Future<List<String>> get getSearchHistoryList =>
      _sharedPrefsHelper.historySearchList;

  Future<void> saveSearchQuery(String query) async {
    List<String> listH = await _sharedPrefsHelper.historySearchList;
    listH.add(query);
    List<String> reversedList = List.from(listH.reversed);
    return _sharedPrefsHelper.saveSearchQuery(reversedList);
    // return _sharedPrefsHelper.saveSearchQuery([]);
  }



}
