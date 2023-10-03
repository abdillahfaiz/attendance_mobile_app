import 'dart:convert';

import 'package:attendance_mobile_app/data/local_resource/auth_local_storage.dart';
import 'package:attendance_mobile_app/data/models/response/auth/profile_response_model.dart';
import 'package:attendance_mobile_app/env/env.dart';
import 'package:http/http.dart' as http;

class ProfileDataSource {
  final baseUrl = baseURL;

  Future<ProfileResponseModel> getProfile() async {
    final token = await AuthLocalStorage().getToken();
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer 20|QV8Mklpoa4hoCl2kXTmRuYEAG1LSmtCpx8rRm9PK'
    };

    try {
      final response =
          await http.get(Uri.parse('/user-detail'), headers: headers);
      final result = ProfileResponseModel.fromJson(jsonDecode(response.body));
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
