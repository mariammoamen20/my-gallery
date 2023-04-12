class LoginModel {
  UserData? user;
  String? token;

  LoginModel.fromJson(dynamic json) {
    user = json["user"] != null ? UserData.fromJson(json["user"]) : null;
    token = json["token"];
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  UserData.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    emailVerifiedAt = json["email_verified_at"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }
}
