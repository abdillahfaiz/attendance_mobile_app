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
