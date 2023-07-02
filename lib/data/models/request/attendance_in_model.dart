import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AttendanceInModel {
  final double latitude;
  final double longitude;
  final String presenceEnterTime;
  AttendanceInModel({
    required this.latitude,
    required this.longitude,
    required this.presenceEnterTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'presenceEnterTime': presenceEnterTime,
    };
  }

  factory AttendanceInModel.fromMap(Map<String, dynamic> map) {
    return AttendanceInModel(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      presenceEnterTime: map['presenceEnterTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AttendanceInModel.fromJson(String source) =>
      AttendanceInModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
