import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eltafouk_ecademy/app/course_content/view_model/tree_course_content_view_model.dart';
import 'package:eltafouk_ecademy/utils/extensions.dart';
import 'package:eltafouk_ecademy/utils/spaces.dart';


import '../../../base_screen.dart';
import '../../../utils/colors.dart';
import '../../../utils/texts.dart';
import '../../course_content_drawer/view/course_content_drawer.dart';
import '../../course_details/widgets/hidden_content.dart';
import '../../parent_home/widgets/exit_app_dialog.dart';
import '../widgets/available_content.dart';

class TreeCourseContentView extends StatefulWidget {
  String courseTitle;
  String courseId;
  String id;
  String mrName;
  String courseName;

  TreeCourseContentView({
    Key? key,
    required this.courseTitle,
    required this.courseId,
    required this.id,
    required this.mrName,
    required this.courseName,
  }) : super(key: key);

  @override
  State<TreeCourseContentView> createState() => _TreeCourseContentViewState();
}

class _TreeCourseContentViewState extends State<TreeCourseContentView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<TreeCourseContentViewModel>(
      onModelReady: (viewModel) async {
        await viewModel.getToken();
        await viewModel.getCourseContentLists(
          token: viewModel.token,
          courseId: widget.courseId,
        );
        viewModel.getTeatchersDataImage(context,widget.id);
      },
      builder: (context, viewModel, child) {
        return ConditionalBuilder(
          condition: viewModel.profileTeacherModel != null,
          builder: (context)=>WillPopScope(
            onWillPop: () async {
              bool exit = await showDialog(
                context: context,
                builder: (context) {
                  return const ExitAPPDialog();
                },
              );
              return Future.value(exit);
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0,
                centerTitle: true,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [kohlyColor, foshiaColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
              drawer: CourseContentDrawerView(
                forumUrl: viewModel.forumUrl,
                id: widget.courseId,
                isForumListEmpty: viewModel.isForumListEmpty,
              ),
              body: viewModel.isCourseLoaded
                  ? SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [kohlyColor, foshiaColor],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          // color: blueColor,
                          height: 80,
                          width: double.infinity,
                        ),
                        Center(
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: SizedBox(
                              height: 120,
                              width: 120,
                              child:Image(
                                image: NetworkImage(
                                  viewModel.profileTeacherModel!.image as String,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    heightSpace(10),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                          widget.mrName,
                        style: TextStyle(
                            color: kohlyliteColor,
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'dinfont',
                            overflow: TextOverflow.ellipsis
                        ),
                        maxLines: 1,
                      ),
                    ),
                    heightSpace(10),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        tr(widget.courseName),
                        style: TextStyle(
                          color: kohlyliteColor,
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'dinfont',
                          overflow: TextOverflow.ellipsis
                        ),
                        maxLines: 1,
                      ),
                    ),
                    heightSpace(10),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ExpansionPanelList.radio(
                        elevation: 0,
                        expandIconColor: kohlyColor,
                        dividerColor: Colors.white,
                        animationDuration: const Duration(milliseconds: 700),
                        children: viewModel.contentsList.map((e) {
                          return ExpansionPanelRadio(
                            canTapOnHeader: true,
                            headerBuilder: (context, isExpanded) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8,),
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [kohlyColor, foshiaColor.withOpacity(.80)],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),borderRadius: BorderRadius.circular(10) ),
                                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 16.0),
                                      roundedButtonText(e.name!),
                                    ],
                                  ),
                                ),
                              );
                            },
                            body: Column(
                              children: e.modules!
                                  .map(
                                    (element) => element.uservisible == true
                                    ? availableContent(element).onTap(
                                      () async {
                                    viewModel.checkContent(
                                      context: context,
                                      element: element,
                                      viewModel: viewModel,
                                      courseId: widget.courseId,
                                    );
                                  },
                                )
                                    : hiddenContent(
                                  context: context,
                                  image: 'assets/icons/video.png',
                                  text: element.name!,
                                  activityId: element.id!,
                                  courseId: widget.courseId,
                                  availMessages: element.availMessage!,
                                  viewModel: viewModel,
                                  element: element,
                                ),
                              )
                                  .toList(),
                            ),
                            value: e.id!,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              )
                  : Center(
                child: CircularProgressIndicator(
                  color: mainColor,
                ),
              ),
            ),
          ),
          fallback: (context) => Container(
              color: Colors.white,
              child: Center(child: CircularProgressIndicator()
              )
          ),
        );

      },
    );
  }
}
