import 'dart:convert';

import 'package:attendance_mobile_app/data/local_resource/auth_local_storage.dart';
import 'package:attendance_mobile_app/data/models/request/login_model.dart';
import 'package:attendance_mobile_app/data/models/response/auth/login_response_model.dart';
import 'package:http/http.dart' as http;

import '../../models/response/auth/profile_response_model.dart';

class AuthDataSource {
  Future<LoginResponseModel> doLogin(LoginModel loginModel) async {
    final response = await http.post(
        Uri.parse('http://absensi.zcbyr.tech/api/login'),
        body: loginModel.toMap());

    if (response.statusCode == 200) {
      final result = LoginResponseModel.fromJson(response.body);
      return result;
    } else {
      throw Exception('${response.statusCode} Email atau Password Salah ');
    }
  }

  Future<ProfileResponseModel> getUserProfile() async {
    final token = await AuthLocalStorage().getToken();
    print(token);
    var headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(
        Uri.parse('http://absensi.zcbyr.tech/api/user-detail'),
        headers: headers);
    final result = ProfileResponseModel.fromJson(jsonDecode(response.body));
    return result;
  }
}
