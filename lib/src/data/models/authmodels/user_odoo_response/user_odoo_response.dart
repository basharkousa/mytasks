class UserOdooResponse {
  var _uid;
  User_context? _userContext;
  var _companyId;
  String? _accessToken;
  String? _expiresIn;

   get uid => _uid;
  User_context get userContext => _userContext!;
  get companyId => _companyId;
  String get accessToken => _accessToken!;
  String get expiresIn => _expiresIn!;

  UserOdooResponse({
    String? uid,
      User_context? userContext,
    String? companyId,
      var accessToken,
      String? expiresIn}){
    _uid = uid;
    _userContext = userContext;
    _companyId = companyId;
    _accessToken = accessToken;
    _expiresIn = expiresIn;
}

  UserOdooResponse.fromJson(dynamic json) {
    _uid = json["uid"].toString();
    _userContext = json["user_context"] != null ? User_context.fromJson(json["user_context"]) : null;
    _companyId = json["company_id"].toString();
    _accessToken = json["access_token"];
    _expiresIn = json["expires_in"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["uid"] = _uid;
    if (_userContext != null) {
      map["user_context"] = _userContext!.toJson();
    }
    map["company_id"] = _companyId;
    map["access_token"] = _accessToken;
    map["expires_in"] = _expiresIn;
    return map;
  }

}

class User_context {
  String? _lang;
  var _tz;
  int? _uid;

  String? get lang => _lang;
   get tz => _tz;
  int? get uid => _uid;

  User_context({
      String? lang,
      String? tz,
      int? uid}){
    _lang = lang!;
    _tz = tz;
    _uid = uid!;
}

  User_context.fromJson(dynamic json) {
    _lang = json["lang"];
    _tz = json["tz"];
    _uid = json["uid"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["lang"] = _lang;
    map["tz"] = _tz;
    map["uid"] = _uid;
    return map;
  }

}