// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final inResponseModel = inResponseModelFromMap(jsonString);

import 'dart:convert';

class AttResponseModel {
    bool? success;
    String? name;
    String? role;
    DateTime? presenceDate;
    double? latitude;
    double? longitude;
    dynamic location;
    String? message;

    AttResponseModel({
        this.success,
        this.name,
        this.role,
        this.presenceDate,
        this.latitude,
        this.longitude,
        this.location,
        this.message,
    });

    factory AttResponseModel.fromJson(String str) => AttResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AttResponseModel.fromMap(Map<String, dynamic> json) => AttResponseModel(
        success: json["success"],
        name: json["name"],
        role: json["role"],
        presenceDate: json["presence_date"] == null ? null : DateTime.parse(json["presence_date"]),
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        location: json["location"],
        message: json["message"],
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "name": name,
        "role": role,
        "presence_date": "${presenceDate!.year.toString().padLeft(4, '0')}-${presenceDate!.month.toString().padLeft(2, '0')}-${presenceDate!.day.toString().padLeft(2, '0')}",
        "latitude": latitude,
        "longitude": longitude,
        "location": location,
        "message": message,
    };


  @override
  String toString() {
    return 'AttResponseModel(success: $success, name: $name, role: $role, presenceDate: $presenceDate, latitude: $latitude, longitude: $longitude, location: $location, message: $message)';
  }
}
