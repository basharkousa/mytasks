class Endpoints {

  Endpoints._();

  // production
  static const String baseUrl = "https://api.todoist.com/rest/v2/";
  static String? signUp = "sign-up";
  static String? logIn = "login";

  static String projects = "projects";
  static String sections = "sections";
  static String tasks = "tasks";

  // receiveTimeout
  static const int receiveTimeout = 90000;

  // connectTimeout
  static const int connectionTimeout = 90000;


}
