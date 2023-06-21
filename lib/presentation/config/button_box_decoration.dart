import 'package:flutter/material.dart';

class BoxDecorationCustom{
BoxDecoration buttonRed = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  boxShadow: const [
    BoxShadow(
      color: Color(0x4cff6a6a),
      blurRadius: 16,
      offset: Offset(0, 8),
    ),
  ],
  gradient: const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xffff7070), Color(0xffff4f4f)],
  ),
);

}
