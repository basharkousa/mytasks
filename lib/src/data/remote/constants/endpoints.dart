class Endpoints {


  Endpoints._();

  // production
  static const String baseUrl = "https://api.todoist.com/rest/v2/";
  // static const baseImageUrl = "https://image.exampe.com/t/p/w342";
  static String projects = "projects";
  static String? signUp = "sign-up";
  static String? logIn = "login";


  // receiveTimeout
  static const int receiveTimeout = 90000;

  // connectTimeout
  static const int connectionTimeout = 90000;

  // Authentication endPoints--------------------------------------------------

  // static const String auth_get_tokens = baseUrl+"/popular"+apiKey;

/*  Map<String, dynamic> queryParameters = {
    "field": ['name', 'email'],
  };
  List<String> list = ['name', 'email'];*/


}
