import 'dart:ui';
import '../../data/local/datasources/sharedpref/shared_preference_helper.dart';
import '../../data/models/user/user.dart';

class LocalDataSource {

  final SharedPreferenceHelper _sharedPrefsHelper;

  LocalDataSource(this._sharedPrefsHelper);

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
    return _sharedPrefsHelper.saveSearchQuery([]);
  }
}
