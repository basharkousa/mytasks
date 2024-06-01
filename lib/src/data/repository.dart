import 'dart:ui';

import 'local/local_data_source.dart';
import 'models/api_response.dart';
import 'models/authmodels/signupresponse/signup_respose.dart';
import 'models/base_api_response.dart';
import 'models/user/user.dart';
import 'remote/remote_data_source.dart';

class Repository extends BaseApiResponse {

  final RemoteDataSource _remoteDataSource;

  final LocalDataSource? _localDataSource;

  Repository(this._remoteDataSource, this._localDataSource);

  /* --------------------------------API METHODS------------------------------------- */

  Future<SignUpResponse> doSignUp(User user) =>
      _remoteDataSource.doSignUp(user);

  Stream<ApiResponse<SignUpResponse>> signUpEasyWay(User user) async * {
    yield ApiResponse.loading("");
    yield await safeApiCall(() => _remoteDataSource.doSignUp(user));
  }

  //Todo Examples here for calling api methods

  /* Future<CurrentCountryResponse> getCurrentCountryDetails() =>
      _remoteDataSource.getCurrentCountryDetails();

  Future<GetTermsResponse> getTerms() => _remoteDataSource.getTerms();

  Future<CompaniesResponse> getCompanies() => _remoteDataSource.getCompanies();

  Future<CountryResponse> getCountries() => _remoteDataSource.getCountries();*/


  /* --------------------------------SHARED_PREFERENCES METHODS------------------------------------- */



  Future<Locale> get fetchLocale => _localDataSource!.fetchLocale;

  Future<User> getUser() => _localDataSource!.getUser();

  Future<void> saveUser(User user) => _localDataSource!.saveUser(user);

  Future<void> removeUser() => _localDataSource!.removeUser();

  Future<List<String>> get getSearchHistoryList =>
      _localDataSource!.getSearchHistoryList;

  Future<void> saveSearchQuery(String query) async => _localDataSource?.saveSearchQuery(query);

  /* --------------------------------DATABASE METHODS------------------------------------- */

  // .......

}
