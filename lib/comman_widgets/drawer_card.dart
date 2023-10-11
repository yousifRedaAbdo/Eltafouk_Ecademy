import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/spaces.dart';
import '../utils/texts.dart';

Widget drawerCard({
  required String text,
}) {
  return Row(
    children: [
      Container(
        color: Colors.white,
        width: 3,
        height: 55,
      ),
      SizedBox(
        width: 10,
      ),
      Container(
        decoration:BoxDecoration(color: whiteColor,borderRadius: BorderRadius.circular(40)),
        height: 45,
        width: 240,
        child: Center(child: title(text, color: blueColor)),
      ),
    ],
  );
}
