

import 'package:flutter/material.dart';
import 'package:eltafouk_ecademy/app/course_content/widgets/activity_image.dart';

import '../../../utils/colors.dart';
import '../../../utils/spaces.dart';
import '../../../utils/texts.dart';
import '../model/final_course_content_mobile_model.dart';

Container availableContent(Modules element) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 6,horizontal: 50),
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    child: Row(
      children: [
        activityImage(
          modName: element.modname!,
          resourceType: element.elementResourceType!,
        ),
        widthSpace(20),
        Flexible(
          child: mediumText(
            element.name!,
            color: blueColor,
          ),
        ),
      ],
    ),
  );
}