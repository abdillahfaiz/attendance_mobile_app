import 'dart:convert';

import 'package:attendance_mobile_app/data/data_resource/Attendance/attendance_datasource.dart';
import 'package:attendance_mobile_app/data/models/request/attendance_in_model.dart';
import 'package:attendance_mobile_app/data/repository/location_repository.dart';
import 'package:attendance_mobile_app/presentation/config/button_box_decoration.dart';
import 'package:attendance_mobile_app/presentation/config/color_config.dart';
import 'package:attendance_mobile_app/presentation/config/text_style.dart';
import 'package:attendance_mobile_app/presentation/utils/table_data_absen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:http/http.dart' as http;

import '../../bloc/attendance/attendance_in/attendance_in_bloc.dart';
import '../../data/local_resource/auth_local_storage.dart';
import '../../data/models/response/attendance_in_response_model.dart';

class PresentPage extends StatefulWidget {
  const PresentPage({super.key});

  @override
  State<PresentPage> createState() => _PresentPageState();
}

class _PresentPageState extends State<PresentPage> {
  late Future _getLocation = LocationRepository().getLocationPosition();
  double lat = 0;
  double long = 0;
  String timePresence = '';
  late Future<AttendanceInResponseModel> _preserrence;

  Future<AttendanceInResponseModel> attendanceIn(
    double lat,
    double lang,
  ) async {
    final String token = await AuthLocalStorage().getToken();
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final response = await http.post(
      Uri.parse('http://absensi.zcbyr.tech/api/absensi/1/hadir'),
      headers: headers,
      body: jsonEncode(<String, dynamic>{'latitude': lat, 'longitude': long}),
    );
    final result = AttendanceInResponseModel.fromJson(
        jsonDecode(response.body.toString()));
    return result;
  }

  @override
  void initState() {
    _getLocation;
    _preserrence;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 39),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.04,
                        child: const Text(
                          'Absensi Kehadiran Karyawan',
                          style: mainTitle,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Image.asset('assets/icons/avatar_icon.png'),
                    ],
                  ),
                  const SizedBox(
                    height: 23.0,
                  ),
                  // FutureBuilder<AttendanceInResponseModel>(
                  //   future: _preserrence,
                  //   builder: ((context, snapshot) {
                  //     if (snapshot.hasData) {
                  //       return Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           DataAttendance(
                  //               title: 'Hari : ',
                  //               value:
                  //                   DateFormat('EEEEE').format(DateTime.now())),
                  //           const SizedBox(
                  //             height: 3.0,
                  //           ),
                  //           DataAttendance(
                  //               title: 'Tanggal : ',
                  //               value: DateFormat('dd-MM-yyyy')
                  //                   .format(DateTime.now())),
                  //           const SizedBox(
                  //             height: 10.0,
                  //           ),
                  //           SizedBox(
                  //             width: MediaQuery.of(context).size.width / 1.6,
                  //             child: const Divider(
                  //               color: mainColor,
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             height: 10.0,
                  //           ),
                  //           DataAttendance(
                  //               title: 'Nama : ',
                  //               value: snapshot.data!.name ?? 'null'),
                  //           const SizedBox(
                  //             height: 3.0,
                  //           ),
                  //           DataAttendance(
                  //               title: 'Role : ',
                  //               value: snapshot.data!.role ?? 'null'),
                  //           const SizedBox(
                  //             height: 3.0,
                  //           ),
                  //           DataAttendance(
                  //               title: 'Jam Hadir : ', value: timePresence),
                  //           const SizedBox(
                  //             height: 3.0,
                  //           ),
                  //           DataAttendance(
                  //               title: 'Latitude : ', value: lat.toString()),
                  //           const SizedBox(
                  //             height: 3.0,
                  //           ),
                  //           DataAttendance(
                  //               title: 'Longitude : ', value: long.toString()),
                  //         ],
                  //       );
                  //     }
                  //     return Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         DataAttendance(
                  //             title: 'Hari : ',
                  //             value:
                  //                 DateFormat('EEEEE').format(DateTime.now())),
                  //         const SizedBox(
                  //           height: 3.0,
                  //         ),
                  //         DataAttendance(
                  //             title: 'Tanggal : ',
                  //             value: DateFormat('dd-MM-yyyy')
                  //                 .format(DateTime.now())),
                  //         const SizedBox(
                  //           height: 10.0,
                  //         ),
                  //         SizedBox(
                  //           width: MediaQuery.of(context).size.width / 1.6,
                  //           child: const Divider(
                  //             color: mainColor,
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           height: 10.0,
                  //         ),
                  //         const DataAttendance(title: 'Nama : ', value: ''),
                  //         const SizedBox(
                  //           height: 3.0,
                  //         ),
                  //         const DataAttendance(title: 'Role : ', value: ''),
                  //         const SizedBox(
                  //           height: 3.0,
                  //         ),
                  //         DataAttendance(
                  //             title: 'Jam Hadir : ', value: timePresence),
                  //         const SizedBox(
                  //           height: 3.0,
                  //         ),
                  //         DataAttendance(
                  //             title: 'Latitude : ', value: lat.toString()),
                  //         const SizedBox(
                  //           height: 3.0,
                  //         ),
                  //         DataAttendance(
                  //             title: 'Longitude : ', value: long.toString()),
                  //       ],
                  //     );
                  //   }),

                  //   // BlocBuilder<AttendanceInBloc, AttendanceInState>(
                  //   //     builder: ((context, state) {
                  //   //   if (state is AttendanceInLoaded) {
                  //   //     print(state.attendanceInResponseModel.latitude);
                  //   //     Column(
                  //   //       crossAxisAlignment: CrossAxisAlignment.start,
                  //   //       children: [
                  //   //         DataAttendance(
                  //   //             title: 'Hari : ',
                  //   //             value:
                  //   //                 DateFormat('EEEEE').format(DateTime.now())),
                  //   //         const SizedBox(
                  //   //           height: 3.0,
                  //   //         ),
                  //   //         DataAttendance(
                  //   //             title: 'Tanggal : ',
                  //   //             value: DateFormat('dd-MM-yyyy')
                  //   //                 .format(DateTime.now())),
                  //   //         const SizedBox(
                  //   //           height: 10.0,
                  //   //         ),
                  //   //         SizedBox(
                  //   //           width: MediaQuery.of(context).size.width / 1.6,
                  //   //           child: const Divider(
                  //   //             color: mainColor,
                  //   //           ),
                  //   //         ),
                  //   //         const SizedBox(
                  //   //           height: 10.0,
                  //   //         ),
                  //   //         DataAttendance(
                  //   //             title: 'Nama : ',
                  //   //             value:
                  //   //                 state.attendanceInResponseModel.name ?? ''),
                  //   //         const SizedBox(
                  //   //           height: 3.0,
                  //   //         ),
                  //   //         DataAttendance(
                  //   //             title: 'Role : ',
                  //   //             value:
                  //   //                 state.attendanceInResponseModel.role ?? ''),
                  //   //         const SizedBox(
                  //   //           height: 3.0,
                  //   //         ),
                  //   //         DataAttendance(
                  //   //             title: 'Jam Hadir : ', value: timePresence),
                  //   //         const SizedBox(
                  //   //           height: 3.0,
                  //   //         ),
                  //   //         DataAttendance(
                  //   //             title: 'Latitude : ', value: lat.toString()),
                  //   //         const SizedBox(
                  //   //           height: 3.0,
                  //   //         ),
                  //   //         DataAttendance(
                  //   //             title: 'Longitude : ', value: long.toString()),
                  //   //       ],
                  //   //     );
                  //   //   }
                  //   //   return Column(
                  //   //     crossAxisAlignment: CrossAxisAlignment.start,
                  //   //     children: [
                  //   //       DataAttendance(
                  //   //           title: 'Hari : ',
                  //   //           value: DateFormat('EEEEE').format(DateTime.now())),
                  //   //       const SizedBox(
                  //   //         height: 3.0,
                  //   //       ),
                  //   //       DataAttendance(
                  //   //           title: 'Tanggal : ',
                  //   //           value: DateFormat('dd-MM-yyyy')
                  //   //               .format(DateTime.now())),
                  //   //       const SizedBox(
                  //   //         height: 10.0,
                  //   //       ),
                  //   //       SizedBox(
                  //   //         width: MediaQuery.of(context).size.width / 1.6,
                  //   //         child: const Divider(
                  //   //           color: mainColor,
                  //   //         ),
                  //   //       ),
                  //   //       const SizedBox(
                  //   //         height: 10.0,
                  //   //       ),
                  //   //       const DataAttendance(title: 'Nama : ', value: ''),
                  //   //       const SizedBox(
                  //   //         height: 3.0,
                  //   //       ),
                  //   //       const DataAttendance(title: 'Role : ', value: ''),
                  //   //       const SizedBox(
                  //   //         height: 3.0,
                  //   //       ),
                  //   //       const DataAttendance(title: 'Jam Hadir : ', value: ''),
                  //   //       const SizedBox(
                  //   //         height: 3.0,
                  //   //       ),
                  //   //       const DataAttendance(title: 'Latitude : ', value: ''),
                  //   //       const SizedBox(
                  //   //         height: 3.0,
                  //   //       ),
                  //   //       const DataAttendance(title: 'Longitude : ', value: ''),
                  //   //     ],
                  //   //   );
                  //   // })),
                  // )
                ],
              ),
            ),
            StreamBuilder(
              stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context, snapshot) {
                List<Marker> allMarkers = [
                  Marker(
                    point: LatLng(
                      lat,
                      long,
                    ),
                    builder: (context) => const Icon(
                      Icons.pin_drop,
                      color: Colors.red,
                      size: 24,
                    ),
                  ),
                ];
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: FlutterMap(
                    options: MapOptions(
                      center: LatLng(
                        lat,
                        long,
                      ),
                      zoom: 16,
                      interactiveFlags:
                          InteractiveFlag.all - InteractiveFlag.rotate,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName:
                            'dev.fleaflet.flutter_map.example',
                      ),
                      MarkerLayer(
                        markers: allMarkers,
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 28.7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () async {
                    Position position = await _getLocation;
                    String timeAttendance =
                        DateFormat("HH:mm:ss").format(DateTime.now());
                    setState(() {
                      lat = position.latitude;
                      long = position.longitude;
                      timePresence = timeAttendance;
                      _preserrence = attendanceIn(lat, long);
                    });
                    // final resultRequest = AttendanceInModel(
                    //     latitude: lat,
                    //     longitude: long,
                    //     presenceEnterTime: timePresence);
                  },
                  child: Container(
                    width: 230,
                    height: 77,
                    decoration: BoxDecorationCustom().buttonBlue,
                    child: Center(
                      child: Text(
                        'Hadir',
                        style: mainTitle.copyWith(
                            color: Colors.white, fontSize: 26),
                      ),
                    ),
                  ),
                ),
                // BlocConsumer<AttendanceInBloc, AttendanceInState>(
                //   listener: (context, state) {
                //     if (state is AttendanceInLoaded) {
                //       showTopSnackBar(
                //         Overlay.of(context),
                //         CustomSnackBar.success(
                //           message: '${state.attendanceInResponseModel.message}',
                //         ),
                //       );
                //     }
                //     if (state is AttendanceInError) {
                //       print(state.messageError);
                //       showTopSnackBar(
                //         Overlay.of(context),
                //         CustomSnackBar.error(
                //           message: state.messageError,
                //         ),
                //       );
                //     }
                //   },
                //   builder: (context, state) {
                //     if (state is AtttendanceInLoading) {
                //       return const Center(
                //         child: CircularProgressIndicator(),
                //       );
                //     }
                //     return InkWell(
                //       onTap: () async {
                //         Position position = await _getLocation;
                //         String timeAttendance =
                //             DateFormat("HH:mm:ss").format(DateTime.now());
                //         setState(() {
                //           lat = position.latitude;
                //           long = position.longitude;
                //           timePresence = timeAttendance;
                //         });
                //         final resultRequest = AttendanceInModel(
                //             latitude: lat,
                //             longitude: long,
                //             presenceEnterTime: timePresence);
                //         context.read<AttendanceInBloc>().add(
                //             DoAttendanceIn(attendanceInModel: resultRequest));
                //       },
                //       child: Container(
                //         width: 230,
                //         height: 77,
                //         decoration: BoxDecorationCustom().buttonBlue,
                //         child: Center(
                //           child: Text(
                //             'Hadir',
                //             style: mainTitle.copyWith(
                //                 color: Colors.white, fontSize: 26),
                //           ),
                //         ),
                //       ),
                //     );
                //   },
                // ),
                StreamBuilder(
                    stream: Stream.periodic(const Duration(seconds: 1)),
                    builder: (context, snapshot) {
                      return SizedBox(
                        height: 50,
                        width: 140,
                        child: Text(
                          DateFormat("HH:mm:ss").format(DateTime.now()),
                          style: mainTitle.copyWith(fontSize: 30),
                        ),
                      );
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
