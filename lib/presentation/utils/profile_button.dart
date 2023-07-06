// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../config/button_box_decoration.dart';
import '../config/text_style.dart';

class ProfileButton extends StatelessWidget {
  BoxDecoration styleButton;
  String asset;
  String title;
  String content;
   ProfileButton({
    Key? key,
    required this.styleButton,
    required this.asset,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
            margin: const EdgeInsets.only(right: 28, left: 28),
            padding: EdgeInsets.only(top: 15, bottom: 15, left: 35),
            width: double.infinity,
            height: 92,
            decoration: styleButton,
            child: Center(
              child: Row(
                children: [
                  SizedBox(
                    height: 61,
                    child: Image.asset(asset, fit: BoxFit.contain,)),
                  const SizedBox(
                  width: 16.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: regularText.copyWith(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),),
                      Text(content, style: mainTitle.copyWith(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 24),)
                    ],
                  ),
                ],
              )
            ),
          );
  }
}
