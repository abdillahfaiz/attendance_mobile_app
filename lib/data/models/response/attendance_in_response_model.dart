import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AttendanceInResponseModel {
  bool? success;
  String? name;
  String? role;
  String? presence_date;
  double? latitude;
  double? longitude;
  String? location;
  String? message;
  AttendanceInResponseModel({
    this.success,
    this.name,
    this.role,
    this.presence_date,
    this.latitude,
    this.longitude,
    this.location,
    this.message,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'succes': success,
      'name': name,
      'role': role,
      'presence_date': presence_date,
      'latitude': latitude,
      'longitude': longitude,
      'location': location,
      'message': message,
    };
  }

  factory AttendanceInResponseModel.fromMap(Map<String, dynamic> map) {
    return AttendanceInResponseModel(
      success: map['success'] as bool,
      name: map['name'] as String,
      role: map['role'] as String,
      presence_date: map['presence_date'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      location: map['location'] as String,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AttendanceInResponseModel.fromJson(String source) =>
      AttendanceInResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AttendanceInResponseModel(success: $success, name: $name, role: $role, presence_date: $presence_date, latitude: $latitude, longitude: $longitude, location: $location, message: $message)';
  }
}

// {
//     "success": true,
//     "name": "Abdillah Faiz",
//     "role": "user",
//     "presence_date": "2023-07-02",
//     "latitude": -6.53,
//     "longitude": 107.04,
//     "location": null,
//     "message": "Kehadiran atas nama 'Abdillah Faiz' berhasil dikirim."
// }