// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final profileResponseModel = profileResponseModelFromMap(jsonString);

import 'dart:convert';

class ProfileResponseModel {
    int id;
    String name;
    String email;
    String position;
    String role;

    ProfileResponseModel({
        required this.id,
        required this.name,
        required this.email,
        required this.position,
        required this.role,
    });

    factory ProfileResponseModel.fromJson(String str) => ProfileResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProfileResponseModel.fromMap(Map<String, dynamic> json) => ProfileResponseModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        position: json["position"],
        role: json["role"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "position": position,
        "role": role,
    };

  @override
  String toString() {
    return 'ProfileResponseModel(id: $id, name: $name, email: $email, position: $position, role: $role)';
  }
}
