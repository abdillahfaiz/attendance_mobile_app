import 'package:attendance_mobile_app/presentation/config/text_style.dart';
import 'package:attendance_mobile_app/presentation/utils/profile_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../data/local_resource/auth_local_storage.dart';
import '../../data/models/response/auth/profile_response_model.dart';
import '../config/button_box_decoration.dart';
import '../utils/absen_button.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<ProfileResponseModel> getUserProfile() async {
    final token = await AuthLocalStorage().getToken();
    var header = {'Authorization': 'Bearer $token'};
    try {
      final response = await http.get(
          Uri.parse('http://absensi.zcbyr.tech/api/user-detail'),
          headers: header);
      if (response.statusCode == 200) {
        final result = ProfileResponseModel.fromJson(response.body);
        return result;
      } else {
        throw Exception('Cannot get data ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error : ${e.toString()}');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            SizedBox(
              height: 372,
              child: Stack(children: [
                Image.asset('assets/images/bg-profile.png'),
                Positioned(
                  top: 150,
                  right: MediaQuery.of(context).size.width / 4,
                  child: Center(
                    child: Container(
                        height: 200,
                        width: 200,
                        child: Image.asset(
                          'assets/icons/avatar_icon.png',
                          fit: BoxFit.contain,
                        )),
                  ),
                ),
              ]),
            ),
            FutureBuilder<ProfileResponseModel>(
                future: getUserProfile(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Container();
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.error(
                        message: snapshot.error.toString(),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    final data = snapshot.data!;
                    return Column(
                      children: [
                        Text(
                          data.name,
                          style: mainTitle.copyWith(fontSize: 24),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          data.email,
                          style: regularText.copyWith(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 45.0,
                        ),
                        ProfileButton(
                            styleButton: BoxDecorationCustom().buttonBlue,
                            asset: 'assets/icons/phone.png',
                            title: 'Phone :',
                            content: data.role),
                        const SizedBox(
                          height: 22.0,
                        ),
                        ProfileButton(
                            styleButton: BoxDecorationCustom().orangeButton,
                            asset: 'assets/icons/role.png',
                            title: 'Role :',
                            content: data.position),
                        const SizedBox(
                          height: 22.0,
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 28, left: 28),
                          padding: EdgeInsets.symmetric(vertical: 14),
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecorationCustom().buttonRed,
                          child: Center(
                              child: Text(
                            'Logout',
                            style: mainTitle.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 24),
                          )),
                        ),
                      ],
                    );
                  }
                  return const Text('null');
                })
          ],
        ),
      ),
    );
  }
}
