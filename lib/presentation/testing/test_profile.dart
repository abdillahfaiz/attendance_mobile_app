// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import '../../data/local_resource/auth_local_storage.dart';
// import '../../data/models/response/profile_response_model.dart';

// class TestingProfile extends StatefulWidget {
//   const TestingProfile({Key? key}) : super(key: key);

//   @override
//   State<TestingProfile> createState() => _TestingProfileState();
// }

// class _TestingProfileState extends State<TestingProfile> {
//   late Future<ProfileResponseModel> profile;

//   Future<ProfileResponseModel> getUserProfile() async {
//     final token = await AuthLocalStorage().getToken();
//     var headers = {'Authorization': 'Bearer $token'};
//     final response = await http.get(
//       Uri.parse('http://absensi.zcbyr.tech/api/user-detail'),
//       headers: headers,
//     );
//     if (response.statusCode == 200) {
//       final result = ProfileResponseModel.fromJson(response.body);
//       return result;
//     } else {
//       throw Exception('Failed to load profile');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     profile = getUserProfile();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: FutureBuilder<ProfileResponseModel>(
//           future: profile,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Text('Loading...');
//             } else if (snapshot.hasData) {
//               final name = snapshot.data!.user.name ?? '';
//               return Text(name);
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else {
//               return Text('No data');
//             }
//           },
//         ),
//       ),
//     );
//   }
// }








/////////////////////////////////////////////////////////
///
///
///
///FutureBuilder<AttendanceInResponseModel>(
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

                    // BlocBuilder<AttendanceInBloc, AttendanceInState>(
                    //     builder: ((context, state) {
                    //   if (state is AttendanceInLoaded) {
                    //     print(state.attendanceInResponseModel.latitude);
                    //     Column(
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
                    //         DataAttendance(
                    //             title: 'Nama : ',
                    //             value:
                    //                 state.attendanceInResponseModel.name ?? ''),
                    //         const SizedBox(
                    //           height: 3.0,
                    //         ),
                    //         DataAttendance(
                    //             title: 'Role : ',
                    //             value:
                    //                 state.attendanceInResponseModel.role ?? ''),
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
                    //   }
                    //   return Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       DataAttendance(
                    //           title: 'Hari : ',
                    //           value: DateFormat('EEEEE').format(DateTime.now())),
                    //       const SizedBox(
                    //         height: 3.0,
                    //       ),
                    //       DataAttendance(
                    //           title: 'Tanggal : ',
                    //           value: DateFormat('dd-MM-yyyy')
                    //               .format(DateTime.now())),
                    //       const SizedBox(
                    //         height: 10.0,
                    //       ),
                    //       SizedBox(
                    //         width: MediaQuery.of(context).size.width / 1.6,
                    //         child: const Divider(
                    //           color: mainColor,
                    //         ),
                    //       ),
                    //       const SizedBox(
                    //         height: 10.0,
                    //       ),
                    //       const DataAttendance(title: 'Nama : ', value: ''),
                    //       const SizedBox(
                    //         height: 3.0,
                    //       ),
                    //       const DataAttendance(title: 'Role : ', value: ''),
                    //       const SizedBox(
                    //         height: 3.0,
                    //       ),
                    //       const DataAttendance(title: 'Jam Hadir : ', value: ''),
                    //       const SizedBox(
                    //         height: 3.0,
                    //       ),
                    //       const DataAttendance(title: 'Latitude : ', value: ''),
                    //       const SizedBox(
                    //         height: 3.0,
                    //       ),
                    //       const DataAttendance(title: 'Longitude : ', value: ''),
                    //     ],
                    //   );
                    // })),
                  // )
