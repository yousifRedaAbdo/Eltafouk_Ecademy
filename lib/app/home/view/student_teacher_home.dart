import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eltafouk_ecademy/MyApplication.dart';
import 'package:eltafouk_ecademy/app/auth/view/log_in_view.dart';
import 'package:eltafouk_ecademy/app/auth/view_model/auth_view_model.dart';
import 'package:eltafouk_ecademy/app/home/model/course_model.dart';
import 'package:eltafouk_ecademy/app/home/model/school_year_model.dart';
import 'package:eltafouk_ecademy/app/home/view/model.dart';
import 'package:eltafouk_ecademy/app/home/widgets/no_content.dart';

import 'package:eltafouk_ecademy/app/home_drawer/view/home_drawer.dart';
import 'package:eltafouk_ecademy/app/teacher_information_for_students/view/teacher_information_for_students_view.dart';
import 'package:eltafouk_ecademy/base_screen.dart';
import 'package:eltafouk_ecademy/enums/screen_state.dart';
import 'package:eltafouk_ecademy/select_student_year.dart';
import 'package:eltafouk_ecademy/utils/colors.dart';
import 'package:eltafouk_ecademy/utils/extensions.dart';
import 'package:eltafouk_ecademy/utils/strings.dart';
import 'package:eltafouk_ecademy/utils/texts.dart';

import '../../../routs/routs_names.dart';
import '../../course_content/view/tree_course_content.dart';
import '../../parent_home/widgets/exit_app_dialog.dart';
import '../model/courses_by_category.dart';
import '../model/my_courses_model.dart';
import '../view_model/student_teacher_view_model.dart';
import '../widgets/course_card.dart';
import '../widgets/hidden_course_card.dart';

class StudentTeacherHomeView extends StatefulWidget {
  StudentTeacherHomeView({Key? key}) : super(key: key);

  AuthenticationViewModel authenticationViewModel = AuthenticationViewModel();
  @override
  State<StudentTeacherHomeView> createState() => _StudentTeacherHomeViewState();
}

class _StudentTeacherHomeViewState extends State<StudentTeacherHomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<StudentTeacherHomeViewModel>(
      onModelReady: (viewModel) async {
        await viewModel.getUserToken();
        if (!mounted) return;
        viewModel.getTeatchersData(context);
        viewModel.getSchoolYearData(context);
        viewModel.getMyCourses(context);
      },
      builder: (context, viewModel, child) {
        viewModel.getCoursesByCategory(context,"${StudentTeacherHomeViewModel.index}");
        return ConditionalBuilder(
          condition: viewModel.coursesByCatogeryModel != null && viewModel.myCoursesModel != null &&  viewModel.homeModel != null && viewModel.schoolYearsModel != null,
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
              backgroundColor: backgroundColor,
              body: viewModel.reservation == true
                  ? SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [kohlyColor, foshiaColor],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  tr("About_the_Academy"),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 170,
                              child: Builder(builder: (context) {
                                print(context.locale.languageCode);
                                return CarouselSlider(
                                    items: [
                                      Builder(builder: (context) {
                                        print(context
                                            .locale.languageCode +
                                            "gg");
                                        return Container(
                                          width: 180,
                                          height: 160,
                                          child: Stack(
                                            children: [
                                              Image(
                                                  image: AssetImage(
                                                      "assets/images/blur.png")),
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .all(12.0),
                                                child: Text(
                                                    tr("massage"),
                                                    style: TextStyle(
                                                        color: Colors
                                                            .white,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold,
                                                        fontSize: 18)),
                                              ),
                                              PositionedDirectional(
                                                end: 7,
                                                width: 28,
                                                height: 40,
                                                top: 5,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors
                                                          .white
                                                          .withOpacity(
                                                          0.3),
                                                      borderRadius: BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(
                                                              15),
                                                          bottomRight:
                                                          Radius.circular(
                                                              15),
                                                          topRight: Radius
                                                              .circular(
                                                              15),
                                                          bottomLeft: Radius
                                                              .circular(
                                                              15))),
                                                  height: 35,
                                                  width: 30,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .all(8.0),
                                                child: Container(
                                                  width: 150,
                                                  height: 150,
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .only(
                                                        left: 8,
                                                        right: 8,
                                                        top: 44),
                                                    child: Text(
                                                      tr("text_massage"),
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors
                                                              .white,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              PositionedDirectional(
                                                end: 8,
                                                width: 24,
                                                top: 10,
                                                child: Icon(
                                                  Icons.email_outlined,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }),
                                      Container(
                                        width: 180,
                                        height: 160,
                                        child: Stack(
                                          children: [
                                            Image(
                                                image: AssetImage(
                                                    "assets/images/blur.png")),
                                            Padding(
                                              padding:
                                              const EdgeInsets.all(
                                                  12.0),
                                              child: Text(tr("vision"),
                                                  style: TextStyle(
                                                      color:
                                                      Colors.white,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold,
                                                      fontSize: 18)),
                                            ),
                                            PositionedDirectional(
                                              end: 7,
                                              width: 28,
                                              height: 40,
                                              top: 5,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withOpacity(
                                                        0.3),
                                                    borderRadius: BorderRadius.only(
                                                        topLeft: Radius
                                                            .circular(
                                                            15),
                                                        bottomRight:
                                                        Radius.circular(
                                                            15),
                                                        topRight: Radius
                                                            .circular(
                                                            15),
                                                        bottomLeft: Radius
                                                            .circular(
                                                            15))),
                                                height: 35,
                                                width: 30,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.all(
                                                  8.0),
                                              child: Container(
                                                width: 150,
                                                height: 150,
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      left: 8,
                                                      right: 8,
                                                      top: 44),
                                                  child: Text(
                                                    tr("text_vision"),
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors
                                                            .white,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            PositionedDirectional(
                                              end: 8,
                                              width: 24,
                                              top: 10,
                                              child: Icon(
                                                Icons
                                                    .visibility_outlined,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 180,
                                        height: 160,
                                        child: Stack(
                                          children: [
                                            Image(
                                                image: AssetImage(
                                                    "assets/images/blur.png")),
                                            Padding(
                                              padding:
                                              const EdgeInsets.all(
                                                  12.0),
                                              child: Text(tr("goal"),
                                                  style: TextStyle(
                                                      color:
                                                      Colors.white,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold,
                                                      fontSize: 18)),
                                            ),
                                            PositionedDirectional(
                                              end: 7,
                                              width: 28,
                                              height: 40,
                                              top: 5,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withOpacity(
                                                        0.3),
                                                    borderRadius: BorderRadius.only(
                                                        topLeft: Radius
                                                            .circular(
                                                            15),
                                                        bottomRight:
                                                        Radius.circular(
                                                            15),
                                                        topRight: Radius
                                                            .circular(
                                                            15),
                                                        bottomLeft: Radius
                                                            .circular(
                                                            15))),
                                                height: 35,
                                                width: 30,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.all(
                                                  8.0),
                                              child: Container(
                                                width: 150,
                                                height: 150,
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      left: 8,
                                                      right: 8,
                                                      top: 35),
                                                  child: Text(
                                                    tr("text_goal"),
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors
                                                            .white,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            PositionedDirectional(
                                              end: 8,
                                              width: 24,
                                              top: 10,
                                              child: Icon(
                                                Icons
                                                    .call_made_outlined,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                    options: CarouselOptions(
                                        height: 250,
                                        enableInfiniteScroll: true,
                                        initialPage: 0,
                                        viewportFraction: 1,
                                        reverse: false,
                                        autoPlay: true,
                                        autoPlayInterval:
                                        const Duration(seconds: 3),
                                        autoPlayAnimationDuration:
                                        const Duration(seconds: 1),
                                        autoPlayCurve:
                                        Curves.fastOutSlowIn,
                                        scrollDirection:
                                        Axis.horizontal));
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Text(
                          tr("Teaching_staff"),
                          style: TextStyle(
                              color: blueColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                          const SizedBox(
                            width: 10,
                          ),
                          itemCount:
                          viewModel.homeModel!.message!.length,
                          itemBuilder: (context, index) {
                            return BuildTeacharItem(
                              indexx: index,
                              viewModel: viewModel,
                              model:
                              viewModel.homeModel!.message![index],
                            ).onTap(
                                  () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TeacherInformationForStudentsView(
                                            viewModel
                                                .homeModel!
                                                .message![index]
                                                .id as String,index
                                        ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              tr("The_courses"),
                              style: TextStyle(
                                  color: blueColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: 60,
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                decoration: const BoxDecoration(
                                  color: greylite,
                                ),
                                child: Center(
                                  child: DropdownButton<String>(
                                    hint: Text("Classroom"),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      size: 30,
                                      color: kohlyColor,
                                    ),
                                    isExpanded: true,
                                    underline: Container(),
                                    dropdownColor: Colors.white,
                                    value: viewModel.selected,
                                    items: viewModel.schoolYearsModel!.data!.map((item) {
                                      return DropdownMenuItem<String>(
                                          value: item.id,
                                          child: Text(
                                              item.name as String ,
                                              style: TextStyle(color: Colors.blueGrey, fontSize: 14,fontWeight: FontWeight.bold)));
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        viewModel.selected = value;
                                        StudentTeacherHomeViewModel.index = value;
                                        //checkSelectYear(context: context,viewModel:viewModel );

                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if(viewModel.coursesByCatogeryModel != null)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 180,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                            const SizedBox(
                              width: 10,
                            ),
                            itemCount: viewModel.coursesByCatogeryModel!.data!.length,
                            itemBuilder: (context, index) {
                              return BuildCategoriesCourses(
                                  index: index,
                                  viewModel: viewModel,
                                  model: viewModel.coursesByCatogeryModel!.data![index] )
                                  .onTap(() async {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                  const Center(
                                    child: CircularProgressIndicator(
                                      color: mainColor,
                                    ),
                                  ),
                                );
                                await viewModel.incCourseView(
                                  courseId: viewModel
                                      .coursesByCatogeryModel!.data![index].id as String,
                                );
                                if (!mounted) return;

                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        TreeCourseContentView(
                                          courseName: viewModel.coursesByCatogeryModel!.data![index].contacts![0].coursename as String,
                                          mrName: viewModel.coursesByCatogeryModel!.data![index].contacts![0].fullname as String,
                                          id: viewModel.coursesByCatogeryModel!.data![index].contacts![0].id as String,
                                          courseId: viewModel
                                              .coursesByCatogeryModel!.data![index].id as String,
                                          courseTitle: viewModel
                                              .coursesByCatogeryModel!.data![index].fullname!,
                                        ),
                                  ),
                                  ModalRoute.withName(
                                    RouteName.treeCourseContentView,
                                  ),
                                );
                              });
                            },
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        tr("my_courses"),
                        style: TextStyle(
                            color: blueColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 180,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                          const SizedBox(
                            width: 10,
                          ),
                          itemCount: viewModel.myCoursesModel!.courses!.length,
                          itemBuilder: (context, index) {
                            return BuildMyCourses(
                                index: index,
                                viewModel: viewModel,
                                model: viewModel.myCoursesModel!.courses![index])
                                .onTap(() async {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) =>
                                const Center(
                                  child: CircularProgressIndicator(
                                    color: mainColor,
                                  ),
                                ),
                              );
                              await viewModel.incCourseView(
                                courseId: viewModel
                                    .myCoursesModel!.courses![index].id!,
                              );
                              if (!mounted) return;

                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      TreeCourseContentView(
                                          courseName: viewModel.myCoursesModel!.courses![index].fullname as String,
                                          mrName: viewModel.myCoursesModel!.courses![index].shortname as String,
                                        id: "16",
                                        courseId: viewModel
                                            .myCoursesModel!.courses![index].id.toString(),
                                        courseTitle: viewModel
                                            .myCoursesModel!.courses![index].fullname as String,
                                      ),
                                ),
                                ModalRoute.withName(
                                  RouteName.treeCourseContentView,
                                ),
                              );
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
                  : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [kohlyColor, foshiaColor],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    tr("About_the_Academy"),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 170,
                                child: Builder(builder: (context) {
                                  print(context.locale.languageCode);
                                  return CarouselSlider(
                                      items: [
                                        Builder(builder: (context) {
                                          print(context
                                              .locale.languageCode +
                                              "gg");
                                          return Container(
                                            width: 180,
                                            height: 160,
                                            child: Stack(
                                              children: [
                                                Image(
                                                    image: AssetImage(
                                                        "assets/images/blur.png")),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .all(12.0),
                                                  child: Text(
                                                      tr("massage"),
                                                      style: TextStyle(
                                                          color: Colors
                                                              .white,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold,
                                                          fontSize:
                                                          18)),
                                                ),
                                                PositionedDirectional(
                                                  end: 7,
                                                  width: 28,
                                                  height: 40,
                                                  top: 5,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .white
                                                            .withOpacity(
                                                            0.3),
                                                        borderRadius: BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(
                                                                15),
                                                            bottomRight:
                                                            Radius.circular(
                                                                15),
                                                            topRight: Radius
                                                                .circular(
                                                                15),
                                                            bottomLeft:
                                                            Radius.circular(
                                                                15))),
                                                    height: 35,
                                                    width: 30,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .all(8.0),
                                                  child: Container(
                                                    width: 150,
                                                    height: 150,
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets
                                                          .only(
                                                          left: 8,
                                                          right: 8,
                                                          top: 44),
                                                      child: Text(
                                                        tr("text_massage"),
                                                        style: TextStyle(
                                                            fontSize:
                                                            13,
                                                            color: Colors
                                                                .white,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                PositionedDirectional(
                                                  end: 8,
                                                  width: 24,
                                                  top: 10,
                                                  child: Icon(
                                                    Icons
                                                        .email_outlined,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        }),
                                        Container(
                                          width: 180,
                                          height: 160,
                                          child: Stack(
                                            children: [
                                              Image(
                                                  image: AssetImage(
                                                      "assets/images/blur.png")),
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .all(12.0),
                                                child: Text(
                                                    tr("vision"),
                                                    style: TextStyle(
                                                        color: Colors
                                                            .white,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold,
                                                        fontSize: 18)),
                                              ),
                                              PositionedDirectional(
                                                end: 7,
                                                width: 28,
                                                height: 40,
                                                top: 5,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors
                                                          .white
                                                          .withOpacity(
                                                          0.3),
                                                      borderRadius: BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(
                                                              15),
                                                          bottomRight:
                                                          Radius.circular(
                                                              15),
                                                          topRight: Radius
                                                              .circular(
                                                              15),
                                                          bottomLeft: Radius
                                                              .circular(
                                                              15))),
                                                  height: 35,
                                                  width: 30,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .all(8.0),
                                                child: Container(
                                                  width: 150,
                                                  height: 150,
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .only(
                                                        left: 8,
                                                        right: 8,
                                                        top: 44),
                                                    child: Text(
                                                      tr("text_vision"),
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors
                                                              .white,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              PositionedDirectional(
                                                end: 8,
                                                width: 24,
                                                top: 10,
                                                child: Icon(
                                                  Icons
                                                      .visibility_outlined,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 180,
                                          height: 160,
                                          child: Stack(
                                            children: [
                                              Image(
                                                  image: AssetImage(
                                                      "assets/images/blur.png")),
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .all(12.0),
                                                child: Text(tr("goal"),
                                                    style: TextStyle(
                                                        color: Colors
                                                            .white,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold,
                                                        fontSize: 18)),
                                              ),
                                              PositionedDirectional(
                                                end: 7,
                                                width: 28,
                                                height: 40,
                                                top: 5,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors
                                                          .white
                                                          .withOpacity(
                                                          0.3),
                                                      borderRadius: BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(
                                                              15),
                                                          bottomRight:
                                                          Radius.circular(
                                                              15),
                                                          topRight: Radius
                                                              .circular(
                                                              15),
                                                          bottomLeft: Radius
                                                              .circular(
                                                              15))),
                                                  height: 35,
                                                  width: 30,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .all(8.0),
                                                child: Container(
                                                  width: 150,
                                                  height: 150,
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .only(
                                                        left: 8,
                                                        right: 8,
                                                        top: 35),
                                                    child: Text(
                                                      tr("text_goal"),
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors
                                                              .white,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              PositionedDirectional(
                                                end: 8,
                                                width: 24,
                                                top: 10,
                                                child: Icon(
                                                  Icons
                                                      .call_made_outlined,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                      options: CarouselOptions(
                                          height: 250,
                                          enableInfiniteScroll: true,
                                          initialPage: 0,
                                          viewportFraction: 1,
                                          reverse: false,
                                          autoPlay: true,
                                          autoPlayInterval:
                                          const Duration(
                                              seconds: 3),
                                          autoPlayAnimationDuration:
                                          const Duration(
                                              seconds: 1),
                                          autoPlayCurve:
                                          Curves.fastOutSlowIn,
                                          scrollDirection:
                                          Axis.horizontal));
                                }),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Text(
                            tr("Teaching_staff"),
                            style: TextStyle(
                                color: blueColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                            const SizedBox(
                              width: 10,
                            ),
                            itemCount:
                            viewModel.homeModel!.message!.length,
                            itemBuilder: (context, index) {
                              return BuildTeacharItem(
                                indexx: index,
                                viewModel: viewModel,
                                model: viewModel
                                    .homeModel!.message![index],
                              ).onTap(
                                    () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          TeacherInformationForStudentsView(
                                              viewModel
                                                  .homeModel!
                                                  .message![index]
                                                  .id as String,
                                              index),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                tr("The_courses"),
                                style: TextStyle(
                                    color: blueColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 200,
                              child: SelectStudyYearNew(),
                            ),
                          ],
                        ),
                      ),
                      viewModel.hiddenCoursesList.isEmpty
                          ? noCoursesAvail()
                          : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                            viewModel.hiddenCoursesList.length,
                            itemBuilder: (context, index) {
                              return BuildCategoriesCoursesHiden(
                                viewModel: viewModel,
                                model: viewModel.coursesByCatogeryModel!.data![index],
                                index:index,
                              ).onTap(
                                    () async {
                                  await viewModel
                                      .enrollStudentToCourse(
                                    token: viewModel.token!,
                                    courseId: viewModel
                                        .hiddenCoursesList[index]
                                        .courseId!,
                                  );
                                  if (viewModel
                                      .enrollStudentToCourseState) {
                                    if (!mounted) return;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            TreeCourseContentView(
                                                courseName: viewModel.coursesByCatogeryModel!.data![index].contacts![0].coursename as String,
                                                mrName: viewModel.coursesByCatogeryModel!.data![index].contacts![0].fullname as String,
                                              id: viewModel.coursesByCatogeryModel!.data![index].contacts![0].id as String,
                                              courseId: viewModel
                                                  .hiddenCoursesList[
                                              index]
                                                  .courseId!,
                                              courseTitle: viewModel
                                                  .hiddenCoursesList[
                                              index]
                                                  .courseName!,
                                            ),
                                      ),
                                    );
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          fallback: (context)=> Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

Widget BuildCategoriesCourses({index,required DataCourses model,required StudentTeacherHomeViewModel viewModel}) => Container(
      child: Stack(
        children: [
          Image(
              image: AssetImage(index % 2 == 0
                  ? "assets/images/course_bink.png"
                  : "assets/images/course_blue.png")),
          Positioned(
            left: 90,
            top: 47,
            child: Container(
              height: 78,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 78,
                    width: 95,
                    child: Text(
                      model.fullname as String,
                      style: const TextStyle(
                          color: kohlyColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                ]
              ),
            ),
          ),
        ],
      ),
    );

Widget BuildCategoriesCoursesHiden({required StudentTeacherHomeViewModel viewModel,required int index,required DataCourses model}) => Container(
  child: Stack(
    children: [
      Image(
          image: AssetImage(index % 2 == 0
              ? "assets/images/course_bink.png"
              : "assets/images/course_blue.png")),
      Positioned(
        left: 90,
        top: 47,
        child: Container(
          height: 78,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tr("mr_name"),
                style: const TextStyle(
                    color: kohlyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                tr("Teacher_specialization"),
                style: const TextStyle(
                    color: kohlyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                tr("first_secondary"),
                style: const TextStyle(
                    color: kohlyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);

Widget BuildMyCourses({index,required Courses model,required StudentTeacherHomeViewModel viewModel}) => Container(
  child: Stack(
    children: [
      Image(
          image: AssetImage(index % 2 == 0
              ? "assets/images/course_bink.png"
              : "assets/images/course_blue.png")),
      Positioned(
        left: 90,
        top: 47,
        child: Container(
          height: 78,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 78,
                  width: 95,
                  child: Text(
                    model.fullname as String,
                    style: const TextStyle(
                        color: kohlyColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

              ]
          ),
        ),
      ),
    ],
  ),
);


Widget BuildTeacharItem(
        {indexx, required Message model, required StudentTeacherHomeViewModel viewModel}) =>
    Stack(
      children: [
        Image(
            image: AssetImage(indexx % 2 == 0
                ? "assets/images/imagee_bink.png"
                : "assets/images/imagee_blue.png")),
        Positioned(
          left: 100,
          top: 20,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.firstname as String,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  model.lastname as String,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 70,
          left: 50,
          child: Center(
            child: CircleAvatar(
              backgroundColor: whiteColor,
              radius: 50,
              child: Container(
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image(
                        image: NetworkImage(
                            model.src as String,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );

Widget BuildAboutAcademyItem(index) => Container(
      width: 120,
      height: 160,
      child: Stack(
        children: [
          Image(image: AssetImage("assets/images/blur_three.png")),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(tr("massage"),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
          ),
          PositionedDirectional(
            end: 2,
            width: 28,
            height: 40,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15))),
              height: 35,
              width: 30,
            ),
          ),
          Container(
            width: 150,
            height: 120,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 44),
              child: Text(
                tr("text_test"),
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          PositionedDirectional(
            end: 4,
            width: 24,
            top: 7,
            child: Icon(
              Icons.email_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
