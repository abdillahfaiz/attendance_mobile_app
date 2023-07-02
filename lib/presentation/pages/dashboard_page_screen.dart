import 'package:attendance_mobile_app/data/data_resource/Auth/auth_datasource.dart';
import 'package:attendance_mobile_app/data/local_resource/auth_local_storage.dart';
import 'package:attendance_mobile_app/presentation/utils/absen_button.dart';
import 'package:attendance_mobile_app/presentation/config/button_box_decoration.dart';
import 'package:attendance_mobile_app/presentation/config/text_style.dart';
import 'package:attendance_mobile_app/presentation/utils/izin_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import '../../bloc/auth/profile/profile_bloc.dart';

class DashboardScreenPage extends StatefulWidget {
  const DashboardScreenPage({Key? key}) : super(key: key);

  @override
  State<DashboardScreenPage> createState() => _DashboardScreenPageState();
}

class _DashboardScreenPageState extends State<DashboardScreenPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(GetProfileDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F8FF),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 19),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/icons/more_icon.png'),
                      const SizedBox(
                        width: 12.0,
                      ),
                      BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
                          if (state is ProfileLoading) {
                            return const CircularProgressIndicator();
                          }
                          if (state is ProfileLoaded) {
                            // String text = 'Hello ${state.profileResponseModel.user!.name}👋';
                            return Text(
                               state.profileResponseModel.user!.name ?? '-',
                              style: mainTitle,
                            );
                          }
                          if (state is ProfileError) {
                            return Text(state.message);
                          }
                          return const Text('No Data');
                        },
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                    ],
                  ),
                  Image.asset('assets/icons/avatar_icon.png'),
                ],
              ),
              const SizedBox(
                height: 32.0,
              ),
              Text(
                'Selamat datang di Aplikasi Absensi ',
                style: mainTitle.copyWith(fontSize: 24),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 48,
                    width: MediaQuery.of(context).size.width / 1.37,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 21,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text('Butuh Bantuan ?', style: thinTitle),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    height: 48,
                    width: 48,
                    decoration: BoxDecorationCustom().buttonRed,
                    child: SvgPicture.asset('assets/icons/help.svg'),
                  ),
                ],
              ),
              const SizedBox(
                height: 32.0,
              ),
              Row(
                children: [
                  Text(
                    'Absensi',
                    style: mainTitle.copyWith(),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/kehadiran-page');
                    },
                    child: const AbsenButton(
                      imageURL: 'assets/icons/kehadiran.png',
                      title: 'Absen Kehadiran Karyawan',
                      sizeImage: 100,
                      shadowColor1: Color(0x3300cbac),
                      shadowColor2: Color(0x3300ccac),
                      colorGradient1: Color(0xff02aab0),
                      colorGradient2: Color(0xff00cdac),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const AbsenButton(
                      imageURL: 'assets/icons/pulang.png',
                      title: "Absensi Pulang Karyawan",
                      sizeImage: 110,
                      shadowColor1: Color(0x4cff7171),
                      shadowColor2: Color(0x4cff9f69),
                      colorGradient1: Color(0xffff844f),
                      colorGradient2: Color(0xffffac70),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              InkWell(
                onTap: () {},
                child: const IzinButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
