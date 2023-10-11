import 'package:flutter/material.dart';
import 'package:eltafouk_ecademy/utils/colors.dart';

Future<void> loadingDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: CircularProgressIndicator(
          color: mainColor,
        ),
      );
    },
  );
}
