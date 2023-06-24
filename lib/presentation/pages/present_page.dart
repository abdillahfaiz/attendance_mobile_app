import 'package:attendance_mobile_app/presentation/config/color_config.dart';
import 'package:attendance_mobile_app/presentation/config/text_style.dart';
import 'package:attendance_mobile_app/presentation/utils/table_data_absen.dart';
import 'package:flutter/material.dart';

class PresentPage extends StatefulWidget {
  const PresentPage({super.key});

  @override
  State<PresentPage> createState() => _PresentPageState();
}

class _PresentPageState extends State<PresentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DataAttendance(title: 'Hari : ', value: ' Senin'),
                  const SizedBox(
                    height: 3.0,
                  ),
                  const DataAttendance(title: 'Tanggal : ', value: 'Senin'),
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
                  const DataAttendance(
                      title: 'Nama : ', value: 'Puan Maharani'),
                  const SizedBox(
                    height: 3.0,
                  ),
                  const DataAttendance(title: 'Role : ', value: 'Karyawan'),
                  const SizedBox(
                    height: 3.0,
                  ),
                  const DataAttendance(title: 'Jam Hadir : ', value: '07:11'),
                  const SizedBox(
                    height: 3.0,
                  ),
                  const DataAttendance(title: 'Latitude : ', value: '6.525277'),
                  const SizedBox(
                    height: 3.0,
                  ),
                  const DataAttendance(
                      title: 'Langitude : ', value: '107.0355607'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
