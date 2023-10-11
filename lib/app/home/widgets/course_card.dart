import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:eltafouk_ecademy/app/teacher_information_for_students/view/teacher_information_for_students_view.dart';
import 'package:eltafouk_ecademy/base_screen.dart';
import 'package:eltafouk_ecademy/utils/colors.dart';
import 'package:eltafouk_ecademy/utils/extensions.dart';
import 'package:eltafouk_ecademy/utils/spaces.dart';

import '../../../utils/texts.dart';
import '../model/course_model.dart';
import '../view_model/student_teacher_view_model.dart';

Widget courseCard({
  required BuildContext context,
  required Course model,
  required StudentTeacherHomeViewModel viewModel,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 20),
    child: Card(
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/Hourglass.gif',
                  placeholderFit: BoxFit.none,
                  placeholderCacheHeight: 50,
                  placeholderCacheWidth: 50,
                  image: model.courseImage!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              heightSpace(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heightSpace(10),
                    title(model.courseName!),
                    smallText(model.courseDesc!),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.visibility,
                              size: 15,
                              color: Colors.grey.shade700,
                            ),
                            widthSpace(10),
                            smallText(model.views!),
                          ],
                        ),
                        RatingBar.builder(
                          itemSize: 15.0,
                          initialRating: double.parse(model.rate!.toString()),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          glow: true,
                          // ignoreGestures: true,
                          unratedColor: Colors.grey,
                          glowColor: Colors.yellow,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          onRatingUpdate: (rating) {
                            viewModel.addCourseRating(
                              context: context,
                              courseId: model.courseId!,
                              rate: rating.toString(),
                            );
                          },
                        ),
                      ],
                    ),
                    heightSpace(5),
                    mainColorTitle('mr_name'.tr()).onTap(
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TeacherInformationForStudentsView(
                              model.courseId!,
                                  0
                            ),
                          ),
                        );
                      },
                    ),
                    heightSpace(10)
                  ],
                ),
              ),
            ],
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                  child: Text(
                    "Mr.Medhat Nabil Xmathes Team",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30),
                  )
              ),
            ),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [kohlyColor, kohlyColor.withOpacity(0.55)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
              ),
              child: smallText(
                tr('new'),
                color: whiteColor,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
