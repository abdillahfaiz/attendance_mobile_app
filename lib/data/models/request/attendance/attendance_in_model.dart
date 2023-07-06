// import 'dart:convert';

// // ignore_for_file: public_member_api_docs, sort_constructors_first
// class AttendanceInModel {
//   final double latitude;
//   final double longitude;
//   final String presenceEnterTime;
//   AttendanceInModel({
//     required this.latitude,
//     required this.longitude,
//     required this.presenceEnterTime,
//   });

//   String toJson() => json.encode(toMap());

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'latitude': latitude,
//       'longitude': longitude,
//       'presenceEnterTime': presenceEnterTime,
//     };
//   }

//   factory AttendanceInModel.fromMap(Map<String, dynamic> map) {
//     return AttendanceInModel(
//       latitude: map['latitude'],
//       longitude: map['longitude'],
//       presenceEnterTime: map['presenceEnterTime'],
//     );
//   }

//   factory AttendanceInModel.fromJson(String source) =>
//       AttendanceInModel.fromMap(
//           json.decode(source.toString()) as Map<String, dynamic>);

//   @override
//   String toString() =>
//       'AttendanceInModel(latitude: $latitude, longitude: $longitude, presenceEnterTime: $presenceEnterTime)';
// }

import 'dart:convert';

class AttendanceInModel {
  final double latitude;
  final double longitude;
  final String presenceEnterTime;

  AttendanceInModel({
    required this.latitude,
    required this.longitude,
    required this.presenceEnterTime,
  });

  factory AttendanceInModel.fromJson(Map<String, dynamic> json) {
    return AttendanceInModel(
        latitude: json['lattitude'],
        longitude: json['longitude'],
        presenceEnterTime: json['presence_enter_time']);
  }

  @override
  String toString() => 'AttendanceInModel(latitude: $latitude, longitude: $longitude, presenceEnterTime: $presenceEnterTime)';

}
