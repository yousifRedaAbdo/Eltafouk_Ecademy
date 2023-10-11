import 'package:flutter/material.dart';
import 'package:eltafouk_ecademy/app/course_details/widgets/restriction_dialog.dart';
import 'package:eltafouk_ecademy/app/web_view/view/web_view.dart';
import 'package:eltafouk_ecademy/utils/colors.dart';
import 'package:eltafouk_ecademy/utils/extensions.dart';
import 'package:eltafouk_ecademy/utils/spaces.dart';
import 'package:eltafouk_ecademy/utils/texts.dart';

import '../../course_content/model/final_course_content_mobile_model.dart';
import '../../course_content/view_model/tree_course_content_view_model.dart';
import 'lesson_restriction_dialog.dart';

Widget hiddenContent({
  context,
  required TreeCourseContentViewModel viewModel,
  required Modules element,
  required String image,
  required String text,
  required String activityId,
  required String courseId,
  required String availMessages,
}) {
  /// split , with \n to move to next line
  var updateAvailMessages = availMessages.replaceAll(',', '\n').toString();
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 50),
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: whiteColor,
    ),
    child: Row(
      children: [
        Image.asset(
          image,
          height: 35,
          fit: BoxFit.cover,
        ),
        widthSpace(20),
        Flexible(child: mediumText(text, color: blueColor)),
      ],
    ),
  ).onTap(
    () async {
      if (element.availMessage!.contains('week')) {
        await lessonsRestrictionDialog(
          context: context,
          description:
              element.availMessage == null ? '' : element.availMessage!,
          activityId: element.id!,
          courseId: courseId,
        ).then(
          (value) async {
            print(value);
            if (value == true) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AppWebView(
                    '${element.url}&token=${viewModel.token}',
                    element.name,
                  ),
                ),
              )..then((value) async {
                  viewModel.isCourseLoaded = false;
                  viewModel.updateState();
                  viewModel.contentsList = [];
                  await viewModel.getToken();
                  viewModel.getCourseContentLists(
                    courseId: courseId,
                    token: viewModel.token,
                  );
                });
            } else if (value == false) {
              viewModel.isCourseLoaded = false;
              viewModel.updateState();
              viewModel.contentsList = [];
              await viewModel.getToken();
              viewModel.getCourseContentLists(
                courseId: courseId,
                token: viewModel.token,
              );
            }
          },
        );
      } else {
        restrictionDialog(context, updateAvailMessages);
      }
    },
  );
}
