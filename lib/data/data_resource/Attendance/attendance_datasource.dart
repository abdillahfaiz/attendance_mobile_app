import 'dart:convert';

import 'package:attendance_mobile_app/data/local_resource/auth_local_storage.dart';
import 'package:attendance_mobile_app/data/models/request/attendance/attendance_in_model.dart';
import 'package:http/http.dart' as http;

import '../../models/request/attendance/attendance_permission_model.dart';
import '../../models/response/attendance/attendance_in_response_model.dart';
import '../../models/response/attendance/attendance_out_response_model.dart';
import '../../models/response/attendance/history_response_model.dart';

class AttendanceDataSource {
  final String baseURL = 'http://absensi.zcbyr.tech/api/absensi';

  Future<AttendanceInResponseModel> attendanceIn(
      AttendanceInModel attendanceModel) async {
    final String token = await AuthLocalStorage().getToken();
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final response = await http.post(
      Uri.parse('$baseURL/1/hadir'),
      headers: headers,
      body: jsonEncode({
        'latitude': attendanceModel.latitude,
        'longitude': attendanceModel.longitude
      }),
    );
    final result = AttendanceInResponseModel.fromJson(
        jsonDecode(response.body.toString()));
    return result;
  }

  Future<AttendanceOutResponseModel> attendanceOut() async {
    final String token = await AuthLocalStorage().getToken();
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final response =
        await http.post(Uri.parse('$baseURL/1/pulang'), headers: headers);

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final result =
          AttendanceOutResponseModel.fromJson(responseData.toString());
      return result;
    } else {
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
    final response = await http.post(
      Uri.parse('$baseURL/1/minta-izin'),
      headers: headers,
      body: permissionModel.toMap(),
    );
    // if (response.statusCode == 201) {
    return PermissionModel.fromJson(jsonDecode(response.body));
    // } else {
    //   throw Exception('Gagal Mengirim Izin');
    // }
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
