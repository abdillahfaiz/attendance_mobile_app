// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AttendanceOutResponseModel {
  final bool success;
  final String name;
  final String role;
  final String message;
  AttendanceOutResponseModel({
    required this.success,
    required this.name,
    required this.role,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'name': name,
      'role': role,
      'message': message,
    };
  }

  factory AttendanceOutResponseModel.fromMap(Map<String, dynamic> map) {
    return AttendanceOutResponseModel(
      success: map['success'] as bool,
      name: map['name'] as String,
      role: map['role'] as String,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AttendanceOutResponseModel.fromJson(String source) =>
      AttendanceOutResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AttendanceOutResponseModel(success: $success, name: $name, role: $role, message: $message)';
  }
}

// {
//     "success": true,
//     "name": "Umar",
//     "role": "user",
//     "message": "Atas nama 'Umar' berhasil melakukan absensi pulang."
// }
