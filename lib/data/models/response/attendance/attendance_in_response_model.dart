// To parse this JSON data, do
//
//     final attendanceInResponseModel = attendanceInResponseModelFromMap(jsonString);

import 'dart:convert';

class AttendanceInResponseModel {
    bool success;
    String name;
    String role;
    DateTime presenceDate;
    dynamic presenceEnterTime;
    double latitude;
    double longitude;
    dynamic location;
    String message;

    AttendanceInResponseModel({
        required this.success,
        required this.name,
        required this.role,
        required this.presenceDate,
        this.presenceEnterTime,
        required this.latitude,
        required this.longitude,
        this.location,
        required this.message,
    });

    factory AttendanceInResponseModel.fromJson(String str) => AttendanceInResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AttendanceInResponseModel.fromMap(Map<String, dynamic> json) => AttendanceInResponseModel(
        success: json["success"],
        name: json["name"],
        role: json["role"],
        presenceDate: DateTime.parse(json["presence_date"]),
        presenceEnterTime: json["presence_enter_time"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        location: json["location"],
        message: json["message"],
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "name": name,
        "role": role,
        "presence_date": "${presenceDate.year.toString().padLeft(4, '0')}-${presenceDate.month.toString().padLeft(2, '0')}-${presenceDate.day.toString().padLeft(2, '0')}",
        "presence_enter_time": presenceEnterTime,
        "latitude": latitude,
        "longitude": longitude,
        "location": location,
        "message": message,
    };
}
