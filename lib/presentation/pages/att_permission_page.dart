import 'dart:convert';

import 'package:attendance_mobile_app/presentation/utils/form_login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../data/local_resource/auth_local_storage.dart';
import '../../data/models/request/attendance/attendance_in_model.dart';
import '../config/button_box_decoration.dart';
import '../config/color_config.dart';
import '../config/text_style.dart';
import '../utils/table_response_attendance/table_data_absen.dart';

class AttendancePermissionPage extends StatefulWidget {
  const AttendancePermissionPage({super.key});

  @override
  State<AttendancePermissionPage> createState() => _AttendancePermissionState();
}

class _AttendancePermissionState extends State<AttendancePermissionPage> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  Map<String, dynamic>? data;
  String? dataa;

  Future postData(String title, String desc) async {
    final token = await AuthLocalStorage().getToken();
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await http.post(
          Uri.parse('http://absensi.zcbyr.tech/api/absensi/1/minta-izin'),
          headers: headers,
          body: {'title': title, 'description': desc});
      final data = jsonEncode(response.body);
      AttResponseModel result = AttResponseModel.fromJson(jsonDecode(data));
      if (result.success!) {
        showTopSnackBar(
          // ignore: use_build_context_synchronously
          Overlay.of(context),
          CustomSnackBar.success(
            message: result.message!,
          ),
        );
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } else {
        showTopSnackBar(
          // ignore: use_build_context_synchronously
          Overlay.of(context),
          CustomSnackBar.error(
            message: '${result.message}',
          ),
        );
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      }
      return response;
    } catch (e) {
      showTopSnackBar(
          // ignore: use_build_context_synchronously
          Overlay.of(context),
          const CustomSnackBar.error(
            message: 'Gagal mengirim perizinan',
          ),
        );
      throw Exception(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child:
                                  const Icon(Icons.arrow_back_ios_new_rounded)),
                          const SizedBox(
                            width: 10.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.04,
                            child: const Text(
                              'Form Perizinan',
                              style: mainTitle,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/profile-page');
                        },
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset(
                            'assets/icons/avatar_icon.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DataAttendance(
                          title: 'Hari : ',
                          value: DateFormat('EEEEE').format(DateTime.now())),
                      const SizedBox(
                        height: 3.0,
                      ),
                      DataAttendance(
                          title: 'Tanggal : ',
                          value:
                              DateFormat('dd-MM-yyyy').format(DateTime.now())),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.6,
                        child: const Divider(
                          color: mainColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const DataAttendance(title: 'Nama : ', value: 'Nama'),
                      const SizedBox(
                        height: 3.0,
                      ),
                      const DataAttendance(title: 'Role : ', value: 'Role'),
                      const SizedBox(
                        height: 3.0,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 27.0,
                  ),
                  const Text(
                    'Alasan Izin ?',
                    style: regularText,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  FormCustom(
                      maxLine: 1,
                      hintText: 'Judul Perizinan',
                      formIcon: Icons.title_outlined,
                      keyboardType: TextInputType.name,
                      obscureText: false,
                      textEditincontroller: titleController),
                  const SizedBox(
                    height: 15.0,
                  ),
                  FormCustom(
                      maxLine: 3,
                      hintText: 'Deskripsi',
                      formIcon: Icons.email,
                      keyboardType: TextInputType.name,
                      obscureText: false,
                      textEditincontroller: descController),
                ],
              ),
              InkWell(
                onTap: () async {
                  postData(titleController.text, descController.text);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 77,
                  decoration: BoxDecorationCustom().blackButton,
                  child: Center(
                    child: Text(
                      'Izin',
                      style:
                          mainTitle.copyWith(color: Colors.white, fontSize: 26),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
