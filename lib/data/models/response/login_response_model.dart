import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginResponseModel {
  final String accesToken;
  LoginResponseModel({
    required this.accesToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accesToken': accesToken,
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      accesToken: map['meta']['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(String source) =>
      LoginResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
