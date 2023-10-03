import 'dart:convert';

import 'package:attendance_mobile_app/data/local_resource/auth_local_storage.dart';
import 'package:attendance_mobile_app/env/env.dart';
import 'package:http/http.dart' as http;

import '../../models/request/attendance/attendance_permission_model.dart';
import '../../models/response/attendance/attendance_out_response_model.dart';

class AttendanceDataSource {
  final String baseUrl = baseURL;

  // Future<AttendanceInResponseModel> attendanceIn(
  //     AttendanceInModel attendanceModel) async {
  //   final String token = await AuthLocalStorage().getToken();
  //   var headers = {
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $token'
  //   };
  //   final response = await http.post(
  //     Uri.parse('$baseURL/1/hadir'),
  //     headers: headers,
  //     body: jsonEncode({
  //       'latitude': attendanceModel.latitude,
  //       'longitude': attendanceModel.longitude
  //     }),
  //   );
  //   final result = AttendanceInResponseModel.fromJson(
  //       jsonDecode(response.body.toString()));
  //   return result;
  // }

  Future<AttendanceOutResponseModel> attendanceOut() async {
    final String token = await AuthLocalStorage().getToken();
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    try {
      final response =
          await http.post(Uri.parse('$baseUrl/1/pulang'), headers: headers);

      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final result =
          AttendanceOutResponseModel.fromJson(responseData.toString());
      return result;
    } catch (e) {
      throw Exception('Failed to perform attendance out');
    }
  }

  Future<PermissionModel> postPermission(
      PermissionModel permissionModel) async {
    final token = await AuthLocalStorage().getToken();
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await http.post(
        Uri.parse('$baseURL/1/minta-izin'),
        headers: headers,
        body: permissionModel.toMap(),
      );
      return PermissionModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw Exception('Gagal Mengirim Izin');
    }
  }

  // Future<List<HistoryResponseModel>> getHistory() async {
  //   final token = await AuthLocalStorage().getToken();
  //   var headers = {
  //     'Accept': 'application/json',
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //     'Authorization': 'Bearer $token'
  //   };
  //   final response = await http.get(
  //     Uri.parse('http://absensi.zcbyr.tech/api/history/1'),
  //     headers: headers,
  //   );
  //   if(response.statusCode == 200){
  //     final jsonResponse = jsonDecode(response.body);
  //     HistoryResponseModel result = HistoryResponseModel.fromJson(jsonDecode(jsonResponse)).toList;
  //     print(result);
  //     // return result;
  //   }else{
  //     throw Exception('Gagal fecth data');
  //   }
  // }
}
