// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:attendance_mobile_app/presentation/utils/table_response_attendance/table_data_absen.dart';

import '../../config/color_config.dart';

class TableResponse extends StatelessWidget {
  
  const TableResponse({
   super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
            value: DateFormat('dd-MM-yyyy').format(DateTime.now())),
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
        
      ],
    );
  }
}
