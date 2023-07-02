import 'package:attendance_mobile_app/data/local_resource/auth_local_storage.dart';
import 'package:attendance_mobile_app/data/models/request/login_model.dart';
import 'package:attendance_mobile_app/data/models/response/login_response_model.dart';
import 'package:http/http.dart' as http;

import '../../models/response/profile_response_model.dart';

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
    var headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(
        Uri.parse('http://absensi.zcbyr.tech/api/user-detail'),
        headers: headers);
    // if (response.statusCode == 200) {
      final result = ProfileResponseModel.fromJson(response.body);
      return result;
    // } else {
    //   throw Exception('Gagal mengambil data');
    // }
  }
}
