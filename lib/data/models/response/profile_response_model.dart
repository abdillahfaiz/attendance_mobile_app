// To parse this JSON data, do
//
//     final profileResponseModel = profileResponseModelFromMap(jsonString);

import 'dart:convert';

class ProfileResponseModel {
    User? user;
    String? status;

    ProfileResponseModel({
        this.user,
        this.status,
    });

    factory ProfileResponseModel.fromJson(String str) => ProfileResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProfileResponseModel.fromMap(Map<String, dynamic> json) => ProfileResponseModel(
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "user": user?.toMap(),
        "status": status,
    };
}

class User {
    int? id;
    String? name;
    String? email;
    dynamic emailVerifiedAt;
    dynamic phone;
    int? positionId;
    int? roleId;
    DateTime? createdAt;
    DateTime? updatedAt;

    User({
        this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.phone,
        this.positionId,
        this.roleId,
        this.createdAt,
        this.updatedAt,
    });

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        phone: json["phone"],
        positionId: json["position_id"],
        roleId: json["role_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "phone": phone,
        "position_id": positionId,
        "role_id": roleId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
