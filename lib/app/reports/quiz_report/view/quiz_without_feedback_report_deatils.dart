import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eltafouk_ecademy/base_screen.dart';
import 'package:eltafouk_ecademy/enums/screen_state.dart';
import 'package:eltafouk_ecademy/utils/colors.dart';
import 'package:eltafouk_ecademy/utils/extensions.dart';
import 'package:eltafouk_ecademy/utils/spaces.dart';
import 'package:eltafouk_ecademy/utils/texts.dart';

import '../../../single_student_report/view/single_student_report_view.dart';
import '../../quizzes_report/model/attmpts_model.dart';
import '../view_model/quiz_without_feedback_detail_report_view_model.dart';

class QuizWithoutFeedbackDetailsView extends StatefulWidget {
  String quizId;
  String courseId;

  QuizWithoutFeedbackDetailsView(this.quizId, this.courseId);

  @override
  State<QuizWithoutFeedbackDetailsView> createState() =>
      _QuizWithoutFeedbackDetailsViewState();
}

class _QuizWithoutFeedbackDetailsViewState
    extends State<QuizWithoutFeedbackDetailsView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<QuizReportViewModel>(
      onModelReady: (viewModel) {
        viewModel.getHomeWorkReport(
          id: widget.quizId,
          sortType: 'atoz',
          context: context,
        );
      },
      builder: (context, viewModel, child) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: mainColor,
              title: appBarTitle(tr('quiz_with_out_feedback')),
              centerTitle: true,
              bottom: TabBar(
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                automaticIndicatorColorAdjustment: true,
                labelColor: mainColor,
                unselectedLabelColor: backgroundColor,
                indicator: const BoxDecoration(
                  color: backgroundColor,
                ),
                tabs: [
                  Tab(
                    child: Text(
                      tr('submitted'),
                    ),
                  ),
                  Tab(
                    child: Text(
                      tr('in_progress'),
                    ),
                  ),
                  Tab(
                    child: Text(
                      tr('not_submitted'),
                    ),
                  ),
                ],
              ),
              actions: [
                DropdownButton(
                  hint: Text(
                    'order_by'.tr(),
                    style: const TextStyle(color: whiteColor, fontSize: 18),
                  ),
                  underline: heightSpace(0),
                  value: viewModel.selectionOrder,
                  alignment: AlignmentDirectional.center,
                  dropdownColor: mainColor,
                  iconSize: 0,
                  items: viewModel.orderByList.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value,
                          style:
                              const TextStyle(color: whiteColor, fontSize: 18)),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    viewModel.sortData(
                      context,
                      newValue!,
                      widget.quizId,
                    );
                  },
                )
              ],
            ),
            body: viewModel.state == ViewState.Busy
                ? const Center(
                    child: CircularProgressIndicator(
                      color: mainColor,
                    ),
                  )
                : TabBarView(
                    children: [
                      submittedView(
                        viewModel.submittedList,
                        widget.courseId,
                      ),
                      inProgressView(
                        viewModel.inProgressList,
                        widget.courseId,
                      ),
                      notSubmittedView(
                        viewModel.notSubmittedList,
                        widget.courseId,
                      )
                    ],
                  ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: backgroundColor,
              elevation: 10,
              child: const Icon(
                Icons.download,
                color: mainColor,
              ),
              onPressed: () async {
                viewModel.generateHomeWorkReportPDF.generateReport(
                  'HomeWok',
                  viewModel.submittedList,
                  viewModel.inProgressList,
                  viewModel.notSubmittedList,
                );
              },
            ),
          ),
        );
      },
    );
  }
}

Widget submittedView(
  List<Submitted> list,
  String courseId,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace(10),
        Text(
          "${tr('student_num')} : ${list.length}",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        heightSpace(10),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return list.isEmpty
                  ? Center(
                      child: mediumText(tr('no_data')),
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: foshiaColor)
                ),
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          radius: 20,
                          child: ClipOval(
                            child: Image.network(
                              list[index].image,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            cardText(
                              list[index].fullname,
                              fontWeight: FontWeight.bold,
                            ),
                            cardText(
                              'Grade :${list[index].grade}',
                              fontWeight: FontWeight.w500,
                            ),
                            cardText(
                              list[index].timefinished,
                            ),
                            cardText(
                              'Center : ${list[index].centername}',
                            ),
                            cardText(
                              'Id : ${list[index].userid}',
                            ),
                          ],
                        ),
                      ),
                    ).onTap(
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SingleStudentReportView(
                              list[index].fullname,
                              list[index].userid,
                              courseId,
                            ),
                          ),
                        );
                      },
                    );
            },
          ),
        ),
      ],
    ),
  );
}

Widget notSubmittedView(List<Notsubmitted> list, String courseId) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace(10),
        Text(
          "${tr('student_num')}: ${list.length}",
          style: const TextStyle(
            fontSize: 15.5,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        heightSpace(10),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return list.isEmpty
                  ? Center(
                      child: mediumText(tr('no_data')),
                    )
                  : Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: foshiaColor)
                ),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          radius: 20,
                          child: ClipOval(
                            child: Image.network(
                              list[index].image,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            cardText(
                              list[index].fullname,
                              fontWeight: FontWeight.bold,
                            ),
                            cardText(
                              'Center : ${list[index].centername}',
                            ),
                            cardText(
                              'Id : ${list[index].userid}',
                            ),
                          ],
                        ),
                      ),
                    ).onTap(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SingleStudentReportView(
                            list[index].fullname,
                            list[index].userid,
                            courseId,
                          ),
                        ),
                      );
                    });
            },
          ),
        ),
      ],
    ),
  );
}

Widget inProgressView(List list, String courseId) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace(10),
        Text(
          "${tr('student_num')} : ${list.length}",
          style: const TextStyle(
            fontSize: 15.5,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        heightSpace(10),
        list.isEmpty
            ? Expanded(
                child: Center(
                  child: mediumText(tr('no_data'), color: mainColor),
                ),
              )
            : Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      color: mainColor,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          radius: 20,
                          child: ClipOval(
                            child: Image.network(
                              list[index].image,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            cardText(
                              list[index].fullname,
                              fontWeight: FontWeight.bold,
                            ),
                            cardText(
                              'Center : ${list[index].centername}',
                            ),
                            cardText(
                              'Id : ${list[index].userid}',
                            ),
                          ],
                        ),
                      ),
                    ).onTap(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SingleStudentReportView(
                            list[index].fullname,
                            list[index].userid,
                            courseId,
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
      ],
    ),
  );
}

cardText(
  String text, {
  FontWeight fontWeight = FontWeight.normal,
  double size = 14,
}) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.black,
      fontSize: size,
      height: 1.5,
      fontWeight: fontWeight,
    ),
  );
}
