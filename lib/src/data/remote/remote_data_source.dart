import '../models/authmodels/signupresponse/signup_respose.dart';
import '../models/user/user.dart';
import 'api/moduls/auth_api.dart';
import 'api/scrap_api.dart';


class RemoteDataSource {

  final ScrapApi _scrapApi;
  final AuthApi _authApi;

  RemoteDataSource(
      this._scrapApi,
      this._authApi,
);

  Future<SignUpResponse> doSignUp(User user) => _authApi.signUpRequest(user);

  Future<SignUpResponse> doNormalLogin(User user) =>
      _authApi.loginNormalRequest(user);


//Todo Examples here for calling apis

/* Future<CurrentCountryResponse> getCurrentCountryDetails() =>
      _scrapApi.getCurrentCountryDetail();

  Future<GetTermsResponse> getTerms() => _scrapApi.getTermsRequest();

  Future<CompaniesResponse> getCompanies() => _scrapApi.getCompaniesRequest();

  Future<CountryResponse> getCountries() => _scrapApi.getCountriesRequest();*/


}
