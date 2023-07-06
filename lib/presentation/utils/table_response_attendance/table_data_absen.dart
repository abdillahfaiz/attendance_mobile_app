// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:attendance_mobile_app/presentation/config/text_style.dart';

class DataAttendance extends StatelessWidget {
  final String title;
  final String value;
  const DataAttendance({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: title,
          style: mainTitle.copyWith(fontSize: 14),
          children: [
            TextSpan(
              text: value,
              style: regularText.copyWith(
                fontSize: 14,
              ),
            ),
          ]),
    );
  }
}
