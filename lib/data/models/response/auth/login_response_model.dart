import 'dart:convert';

class LoginResponseModel {
  String? token;

  LoginResponseModel({
    this.token,
  });

  factory LoginResponseModel.fromJson(String str) =>
      LoginResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromMap(Map<String, dynamic> json) =>
      LoginResponseModel(
        token: json["meta"]["token"],
      );

  Map<String, dynamic> toMap() => {
        "access_token": token,
      };
}
