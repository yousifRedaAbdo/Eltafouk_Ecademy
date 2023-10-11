import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eltafouk_ecademy/app/access_to_course/view/access_to_course_view.dart';
import 'package:eltafouk_ecademy/app/auth/view/log_in_view.dart';
import 'package:eltafouk_ecademy/app/auth/view/sign_up_view.dart';
import 'package:eltafouk_ecademy/app/codes_info/view/codes_information_view.dart';
import 'package:eltafouk_ecademy/app/home/view/student_teacher_home.dart';
import 'package:eltafouk_ecademy/app/lay_out/lay_out_screen.dart';
import 'package:eltafouk_ecademy/base_screen.dart';
import 'package:eltafouk_ecademy/comman_widgets/drawer_card.dart';
import 'package:eltafouk_ecademy/utils/colors.dart';
import 'package:eltafouk_ecademy/utils/extensions.dart';
import 'package:eltafouk_ecademy/utils/spaces.dart';

import '../../course_members/view/course_members_view.dart';
import '../../reports/reports/view/reports_view.dart';
import '../view_model/course_content_drawer_view_model.dart';

class CourseContentDrawerView extends StatelessWidget {
  String id;
  String forumUrl;
  bool isForumListEmpty;

  CourseContentDrawerView({
    Key? key,
    required this.id,
    required this.forumUrl,
    required this.isForumListEmpty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CourseContentDrawerViewModel>(
      onModelReady: (viewModel) async {
        await viewModel.getToken();
        viewModel.getUserRole();
      },
      builder: (context, viewModel, child) {
        return Drawer(
            child: viewModel.userRole == ''
                ? const Center(
                    child: CircularProgressIndicator(
                      color: whiteColor,
                    ),
                  )
                : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [kohlyColor, foshiaColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          heightSpace(50),
                          drawerCard(
                            text: tr('home'),
                          ).onTap(() {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LayOutScreen()),
                                (Route<dynamic> route) => false);
                          }),
                          heightSpace(20),
                          viewModel.userRole == 'teacher'
                              ? drawerCard(
                                  text: 'course_members'.tr(),
                                ).onTap(
                                  () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CourseMembersView(id),
                                      ),
                                    );
                                  },
                                )
                              : Container(),
                          heightSpace(20),
                          viewModel.userRole == 'teacher'
                              ? drawerCard(
                            text: 'accessed_to_course'.tr(),
                                ).onTap(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AccessToCourseReportView(id),
                                    ),
                                  );
                                })
                              : Container(),
                          heightSpace(20),
                          viewModel.userRole == 'teacher'
                              ? drawerCard(
                                  text: 'code_info'.tr(),
                                ).onTap(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CodesInformation(id),
                                    ),
                                  );
                                })
                              : Container(),
                          heightSpace(20),
                          viewModel.userRole == 'teacher'
                              ? drawerCard(
                                  text: 'reports'.tr(),
                                ).onTap(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ReportsView(id),
                                    ),
                                  );
                                })
                              : Container(),
                          heightSpace(20),
                          viewModel.userRole == 'teacher'
                              ? drawerCard(
                                  text: 'create_user'.tr(),
                                ).onTap(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignUp(),
                                    ),
                                  );
                                })
                              : Container(),
                        ],
                      ),
                    ),
                ));
      },
    );
  }
}
