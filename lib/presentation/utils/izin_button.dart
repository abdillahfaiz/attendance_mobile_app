import 'package:attendance_mobile_app/presentation/config/text_style.dart';
import 'package:flutter/material.dart';

class IzinButton extends StatelessWidget {
  const IzinButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                // width: MediaQuery.of(context).size.width / 1.13,
                width: 365,
                padding: const EdgeInsets.symmetric(horizontal: 50),
                height: 102,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33353535),
                      blurRadius: 16,
                      offset: Offset(4, 8),
                    ),
                  ],
                  gradient: const LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                      Colors.black,
                      Color(0xff2d2c2c),
                      Color(0xff626262)
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/izin.png',
                      width: 91,
                    ),
                    Expanded(
                      child: Text(
                        'Absen Perizinan Karyawan',
                       style: mainTitle.copyWith(color: Colors.white, fontSize: 16, overflow: TextOverflow.fade)
                      ),
                    ),
                  ],
                ),
              );
  }
}