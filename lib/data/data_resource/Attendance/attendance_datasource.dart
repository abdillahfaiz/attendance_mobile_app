import 'dart:convert';

import 'package:attendance_mobile_app/data/local_resource/auth_local_storage.dart';
import 'package:attendance_mobile_app/data/models/request/attendance_in_model.dart';
import 'package:http/http.dart' as http;

import '../../models/response/attendance_in_response_model.dart';

class AttendanceDataSource {
  final String baseURL = 'http://absensi.zcbyr.tech/api/absensi/';

  Future<AttendanceInResponseModel> attendanceIn(
      AttendanceInModel attendanceModel) async {
    final String token = await AuthLocalStorage().getToken();
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final response = await http.post(
      Uri.parse('http://absensi.zcbyr.tech/api/absensi/1/hadir'),
      headers: headers,
      body: attendanceModel,
    );
    final result = AttendanceInResponseModel.fromJson(json.decode(response.body.toString()));
    return result;
  }
}
