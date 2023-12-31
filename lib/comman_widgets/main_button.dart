import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/texts.dart';

Widget mainButton(String text) {
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(35),
      color: grey.withOpacity(.3),
    ),
    child: Center(child: roundedButtonText(text)),
  );
}
