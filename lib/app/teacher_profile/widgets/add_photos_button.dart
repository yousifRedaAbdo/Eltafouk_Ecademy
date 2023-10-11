import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eltafouk_ecademy/app/teacher_profile/view/edit_image_view.dart';

import 'package:eltafouk_ecademy/app/teacher_profile/view_model/teacher_profile_view_model.dart';

import 'package:eltafouk_ecademy/utils/colors.dart';
import 'package:eltafouk_ecademy/utils/texts.dart';

import '../view_model/teacher_profile_view_model.dart';

ElevatedButton addPhotosButton(
    BuildContext context, TeacherProfileViewModel viewModel) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: mainColor,
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditImageView(),
        ),
      );
    },
    child: roundedButtonText(tr('edit_image')),
  );
}
