class Endpoints {


  Endpoints._();

  // production
  static const String baseUrl = "https://api.todoist.com/rest/v2/";
  static String? signUp = "sign-up";
  static String? logIn = "login";

  static const String projects = "projects";
  static const String sections = "sections";
  static const String tasks = "tasks";
  static const String comments = 'comments';

  // receiveTimeout
  static const int receiveTimeout = 90000;

  // connectTimeout
  static const int connectionTimeout = 90000;


}
