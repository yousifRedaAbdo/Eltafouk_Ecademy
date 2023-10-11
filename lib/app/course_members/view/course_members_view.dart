import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eltafouk_ecademy/app/course_members/widgets/course_members_card.dart';
import 'package:eltafouk_ecademy/app/course_members/widgets/course_members_search.dart';
import 'package:eltafouk_ecademy/app/course_members/widgets/student_count.dart';
import 'package:eltafouk_ecademy/base_screen.dart';
import 'package:eltafouk_ecademy/utils/colors.dart';
import 'package:eltafouk_ecademy/utils/spaces.dart';
import 'package:eltafouk_ecademy/utils/texts.dart';

import '../view_model/course_member_view_model.dart';

// ignore: must_be_immutable
class CourseMembersView extends StatelessWidget {
  String id;
  CourseMembersView(this.id, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView<CourseMembersViewModel>(
      onModelReady: (viewModel) {
        viewModel.getMembers(courseId: id);
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: whiteColor,
          floatingActionButton: FloatingActionButton(
            backgroundColor: backgroundColor,
            elevation: 10,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [kohlyColor, foshiaColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(
                Icons.download,
                color: whiteColor,
              ),
            ),
            onPressed: () {
              viewModel.generateCourseMembersReportPDF
                  .generateReport(viewModel.searchList);
            },
          ),
          appBar: AppBar(
            elevation: 0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [kohlyColor, foshiaColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            title: appBarTitle('course_members'.tr()),
            centerTitle: true,
          ),
          body: !viewModel.getData
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                )
              : Column(
                  children: [
                    courseMembersSearch(viewModel),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: whiteColor,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: studentCount(
                                  viewModel.searchList.length.toString()),
                            ),
                            heightSpace(10),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: viewModel.searchList.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      child: courseMembersCard(
                                        context: context,
                                        id: id,
                                        index: index,
                                        member: viewModel.searchList[index],
                                        viewModel: viewModel,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
