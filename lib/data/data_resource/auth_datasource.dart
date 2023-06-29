import 'package:attendance_mobile_app/data/local_resource/auth_local_storage.dart';
import 'package:attendance_mobile_app/data/models/request/login_model.dart';
import 'package:attendance_mobile_app/data/models/response/login_response_model.dart';
import 'package:http/http.dart' as http;

import '../models/response/user_response_model.dart';

class AuthDataSource {
  Future<LoginResponseModel> doLogin(LoginModel loginModel) async {
    final response = await http.post(
        Uri.parse('http://absensi.zcbyr.tech/api/login'),
        body: loginModel.toMap());
    final result = LoginResponseModel.fromJson(response.body);
    return result;
  }

  Future<UserResponseModel> getUserProfile() async {
    final token = await AuthLocalStorage().getToken();
    final response = await http.get(
        Uri.parse('http://absensi.zcbyr.tech/api/user-detail'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'});
    final result = UserResponseModel.fromJson(response.body);
    return result;
  }
}
