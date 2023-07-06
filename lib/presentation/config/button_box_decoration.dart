import 'package:flutter/material.dart';

class BoxDecorationCustom {
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

  BoxDecoration buttonBlue = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    boxShadow: const [
      BoxShadow(
        color: Color(0x3300CBAC),
        blurRadius: 14.08,
        offset: Offset(0, 8.45),
        spreadRadius: 0,
      ),
      BoxShadow(
        color: Color(0x3300CCAC),
        blurRadius: 11.26,
        offset: Offset(0, 5.63),
        spreadRadius: 0,
      )
    ],
    gradient: const LinearGradient(
      begin: Alignment(0.00, 1.00),
      end: Alignment(0, -1),
      colors: [Color(0xFF02AAB0), Color(0xFF00CDAC)],
    ),
  );
  BoxDecoration orangeButton = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    boxShadow: const [
      BoxShadow(
        color: Color(0x33676088),
        blurRadius: 20,
        offset: Offset(0, 12),
        spreadRadius: 0,
      ),
      BoxShadow(
        color: Color(0x33676088),
        blurRadius: 16,
        offset: Offset(0, 8),
        spreadRadius: 0,
      )
    ],
    gradient: const LinearGradient(
      begin: Alignment(0.00, 1.00),
      end: Alignment(0, -1),
      colors: [Color(0xFFFFAC71), Color(0xFFFF8450)],
    ),
  );

  BoxDecoration blackButton = BoxDecoration(
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
      colors: [Colors.black, Color(0xff2d2c2c), Color(0xff626262)],
    ),
  );
}