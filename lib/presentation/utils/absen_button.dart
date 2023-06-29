// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:attendance_mobile_app/presentation/config/text_style.dart';

class AbsenButton extends StatelessWidget {
  final String imageURL;
  final String title;
  final double sizeImage;
  final Color shadowColor1;
  final Color shadowColor2;
  final Color colorGradient1;
  final Color colorGradient2;
  const AbsenButton({
    Key? key,
    required this.imageURL,
    required this.title,
    required this.sizeImage,
    required this.shadowColor1,
    required this.shadowColor2,
    required this.colorGradient1,
    required this.colorGradient2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.33,
      height: 224,
      padding: const EdgeInsets.only(left: 12, right: 12, top: 33),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.79),
        boxShadow: [
          BoxShadow(
            color: shadowColor1,
            blurRadius: 13.58,
            offset: const Offset(0, 8.15),
          ),
          BoxShadow(
            color: shadowColor2,
            blurRadius: 10.86,
            offset: const Offset(0, 5.43),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [colorGradient1, colorGradient2],
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            imageURL,
            width: 100,
          ),
          const SizedBox(
            height: 21.0,
          ),
          Text(
            title,
            style: mainTitle.copyWith(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
