import 'package:attendance_mobile_app/data/local_resource/auth_local_storage.dart';
import 'package:http/http.dart' as http;

class AttendanceDataSource {
  final String baseURL = 'http://absensi.zcbyr.tech/api/absensi/';

  Future attendanceIn () async {
    final String token = await AuthLocalStorage().getToken();
    final headers = {'Authorization': 'Bearer $token'};
    final response = await http.post(Uri.parse('$baseURL/4/hadir'), headers: headers);
    if(response.statusCode == 200){
      final result = response.body;
      return result;
    }else{
      throw Exception('Anda sudah absen hari ini / sudah diluar waktu absen');
    }
  }
}