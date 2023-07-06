// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:attendance_mobile_app/presentation/config/color_config.dart';

class FormCustom extends StatelessWidget {
  final String hintText;
  final IconData formIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController textEditincontroller;
  int maxLine;
   FormCustom({
    Key? key,
    required this.hintText,
    required this.formIcon,
    required this.keyboardType,
    required this.obscureText,
    required this.textEditincontroller,
    required this.maxLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 55,
      padding: const EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: mainColor),
      ),
      child:  TextField(
        maxLines: maxLine,
        decoration: InputDecoration(
          icon: Icon(
            formIcon,
            color: mainColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
        obscureText: obscureText,
        keyboardType: TextInputType.emailAddress,
        controller: textEditincontroller,
      ),
    );
  }
}
