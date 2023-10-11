// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:medhat_nabil/MyApplication.dart';
// import 'package:medhat_nabil/app/auth/view/log_in_view.dart';
// import 'package:medhat_nabil/app/auth/view_model/auth_view_model.dart';
// import 'package:medhat_nabil/app/home/model/course_model.dart';
// import 'package:medhat_nabil/app/home/view/cubit.dart';
// import 'package:medhat_nabil/app/home/view/model.dart';
// import 'package:medhat_nabil/app/home/view/states.dart';
// import 'package:medhat_nabil/app/home/widgets/no_content.dart';
//
// import 'package:medhat_nabil/app/home_drawer/view/home_drawer.dart';
// import 'package:medhat_nabil/app/teacher_information_for_students/view/teacher_information_for_students_view.dart';
// import 'package:medhat_nabil/base_screen.dart';
// import 'package:medhat_nabil/enums/screen_state.dart';
// import 'package:medhat_nabil/select_student_year.dart';
// import 'package:medhat_nabil/utils/colors.dart';
// import 'package:medhat_nabil/utils/extensions.dart';
// import 'package:medhat_nabil/utils/texts.dart';
//
// import '../../../routs/routs_names.dart';
// import '../../course_content/view/tree_course_content.dart';
// import '../../parent_home/widgets/exit_app_dialog.dart';
// import '../view_model/student_teacher_view_model.dart';
// import '../widgets/course_card.dart';
// import '../widgets/hidden_course_card.dart';
//
// class StudentTeacherHomeVieww extends StatefulWidget {
//   StudentTeacherHomeVieww({Key? key}) : super(key: key);
//
//   AuthenticationViewModel authenticationViewModel = AuthenticationViewModel();
//
//   @override
//   State<StudentTeacherHomeVieww> createState() => _StudentTeacherHomeViewState();
// }
//
// class _StudentTeacherHomeViewState extends State<StudentTeacherHomeVieww> {
//   @override
//   Widget build(BuildContext context) {
//         return BlocProvider(
//           create: (BuildContext context)=>HomeCubit()..getTeatchersData(),
//           child: BlocConsumer<HomeCubit,HomeStates>(
//             listener: (context, state){
//             },
//             builder: (context, state){
//                 return WillPopScope(
//                    onWillPop: () async {
//                      bool exit = await showDialog(
//                        context: context,
//                        builder: (context) {
//                          return const ExitAPPDialog();
//                        },
//                      );
//                      return Future.value(exit);
//                    },
//                    child: Scaffold(
//                      backgroundColor: backgroundColor,
//                      drawer: HomeDrawerView(),
//                      appBar: AppBar(
//                        elevation: 0,
//                        flexibleSpace: Container(
//                          decoration: BoxDecoration(
//                            gradient: LinearGradient(
//                              colors: [kohlyColor, foshiaColor],
//                              begin: Alignment.topLeft,
//                              end: Alignment.bottomRight,
//                            ),
//                          ),
//                        ),
//                        actions: [
//                          Center(
//                              child: Column(
//                                mainAxisAlignment: MainAxisAlignment.end,
//                                children: [
//                                  Center(
//                                    child: Text(
//                                      tr("acadmi_name"),
//                                      style: TextStyle(
//                                          fontSize: 14,
//                                          fontWeight: FontWeight.bold),
//                                    ),
//                                  ),
//                                  SizedBox(
//                                    height: 15,
//                                  ),
//                                  Container(
//                                    height: 2,
//                                    width: 130,
//                                    color: Colors.white,
//                                  )
//                                ],
//                              )),
//                          SizedBox(
//                            width: 10,
//                          ),
//                          Image(
//                            image: AssetImage("assets/images/logo_academy.png"),
//                            height: 50,
//                            width: 50,
//                          ),
//                          SizedBox(
//                            width: 10,
//                          ),
//                        ],
//                        title: IconButton(
//                            onPressed: () {
//                              if (context.locale.languageCode == "en") {
//                                context.setLocale(Locale("ar"));
//                              } else {
//                                context.setLocale(Locale("en"));
//                              }
//
//                              ;
//                            },
//                            icon: Icon(Icons.language),
//                            color: whiteColor),
//                        centerTitle: false,
//                      ),
//                      body: HomeCubit.get(context).homeModel == null
//                          ? const Center(
//                        child: CircularProgressIndicator(
//                          color: mainColor,
//                        ),
//                      )
//                          : HomeCubit.get(context).reservation == true
//                          ? SingleChildScrollView(
//                        physics: BouncingScrollPhysics(),
//                        child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: [
//                            Container(
//                              width: double.infinity,
//                              height: 250,
//                              decoration: BoxDecoration(
//                                gradient: LinearGradient(
//                                  colors: [kohlyColor, foshiaColor],
//                                  begin: Alignment.topLeft,
//                                  end: Alignment.bottomRight,
//                                ),
//                              ),
//                              child: Padding(
//                                padding:
//                                const EdgeInsets.symmetric(horizontal: 10),
//                                child: Column(
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: [
//                                    Center(
//                                      child: Padding(
//                                        padding: const EdgeInsets.all(8.0),
//                                        child: Text(
//                                          tr("About_the_Academy"),
//                                          style: TextStyle(
//                                              color: Colors.white,
//                                              fontSize: 24,
//                                              fontWeight: FontWeight.bold),
//                                        ),
//                                      ),
//                                    ),
//                                    SizedBox(
//                                      height: 20,
//                                    ),
//                                    Container(
//                                      height: 170,
//                                      child: Builder(builder: (context) {
//                                        print(context.locale.languageCode);
//                                        return CarouselSlider(
//                                            items: [
//                                              Builder(builder: (context) {
//                                                print(context
//                                                    .locale.languageCode +
//                                                    "gg");
//                                                return Container(
//                                                  width: 180,
//                                                  height: 160,
//                                                  child: Stack(
//                                                    children: [
//                                                      Image(
//                                                          image: AssetImage(
//                                                              "assets/images/blur.png")),
//                                                      Padding(
//                                                        padding:
//                                                        const EdgeInsets
//                                                            .all(12.0),
//                                                        child: Text(
//                                                            tr("massage"),
//                                                            style: TextStyle(
//                                                                color: Colors
//                                                                    .white,
//                                                                fontWeight:
//                                                                FontWeight
//                                                                    .bold,
//                                                                fontSize: 18)),
//                                                      ),
//                                                      PositionedDirectional(
//                                                        end: 7,
//                                                        width: 28,
//                                                        height: 40,
//                                                        top: 5,
//                                                        child: Container(
//                                                          decoration: BoxDecoration(
//                                                              color: Colors
//                                                                  .white
//                                                                  .withOpacity(
//                                                                  0.3),
//                                                              borderRadius: BorderRadius
//                                                                  .only(
//                                                                  topLeft: Radius
//                                                                      .circular(
//                                                                      15),
//                                                                  bottomRight:
//                                                                  Radius
//                                                                      .circular(
//                                                                      15),
//                                                                  topRight: Radius
//                                                                      .circular(
//                                                                      15),
//                                                                  bottomLeft: Radius
//                                                                      .circular(
//                                                                      15))),
//                                                          height: 35,
//                                                          width: 30,
//                                                        ),
//                                                      ),
//                                                      Padding(
//                                                        padding:
//                                                        const EdgeInsets
//                                                            .all(8.0),
//                                                        child: Container(
//                                                          width: 150,
//                                                          height: 150,
//                                                          child: Padding(
//                                                            padding:
//                                                            const EdgeInsets
//                                                                .only(
//                                                                left: 8,
//                                                                right: 8,
//                                                                top: 44),
//                                                            child: Text(
//                                                              tr("text_massage"),
//                                                              style: TextStyle(
//                                                                  fontSize: 13,
//                                                                  color: Colors
//                                                                      .white,
//                                                                  fontWeight:
//                                                                  FontWeight
//                                                                      .bold),
//                                                            ),
//                                                          ),
//                                                        ),
//                                                      ),
//                                                      PositionedDirectional(
//                                                        end: 8,
//                                                        width: 24,
//                                                        top: 10,
//                                                        child: Icon(
//                                                          Icons.email_outlined,
//                                                          color: Colors.white,
//                                                        ),
//                                                      )
//                                                    ],
//                                                  ),
//                                                );
//                                              }),
//                                              Container(
//                                                width: 180,
//                                                height: 160,
//                                                child: Stack(
//                                                  children: [
//                                                    Image(
//                                                        image: AssetImage(
//                                                            "assets/images/blur.png")),
//                                                    Padding(
//                                                      padding:
//                                                      const EdgeInsets.all(
//                                                          12.0),
//                                                      child: Text(tr("vision"),
//                                                          style: TextStyle(
//                                                              color:
//                                                              Colors.white,
//                                                              fontWeight:
//                                                              FontWeight
//                                                                  .bold,
//                                                              fontSize: 18)),
//                                                    ),
//                                                    PositionedDirectional(
//                                                      end: 7,
//                                                      width: 28,
//                                                      height: 40,
//                                                      top: 5,
//                                                      child: Container(
//                                                        decoration: BoxDecoration(
//                                                            color: Colors.white
//                                                                .withOpacity(
//                                                                0.3),
//                                                            borderRadius: BorderRadius
//                                                                .only(
//                                                                topLeft: Radius
//                                                                    .circular(
//                                                                    15),
//                                                                bottomRight:
//                                                                Radius.circular(
//                                                                    15),
//                                                                topRight: Radius
//                                                                    .circular(
//                                                                    15),
//                                                                bottomLeft: Radius
//                                                                    .circular(
//                                                                    15))),
//                                                        height: 35,
//                                                        width: 30,
//                                                      ),
//                                                    ),
//                                                    Padding(
//                                                      padding:
//                                                      const EdgeInsets.all(
//                                                          8.0),
//                                                      child: Container(
//                                                        width: 150,
//                                                        height: 150,
//                                                        child: Padding(
//                                                          padding:
//                                                          const EdgeInsets
//                                                              .only(
//                                                              left: 8,
//                                                              right: 8,
//                                                              top: 44),
//                                                          child: Text(
//                                                            tr("text_vision"),
//                                                            style: TextStyle(
//                                                                fontSize: 13,
//                                                                color: Colors
//                                                                    .white,
//                                                                fontWeight:
//                                                                FontWeight
//                                                                    .bold),
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    PositionedDirectional(
//                                                      end: 8,
//                                                      width: 24,
//                                                      top: 10,
//                                                      child: Icon(
//                                                        Icons
//                                                            .visibility_outlined,
//                                                        color: Colors.white,
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                              Container(
//                                                width: 180,
//                                                height: 160,
//                                                child: Stack(
//                                                  children: [
//                                                    Image(
//                                                        image: AssetImage(
//                                                            "assets/images/blur.png")),
//                                                    Padding(
//                                                      padding:
//                                                      const EdgeInsets.all(
//                                                          12.0),
//                                                      child: Text(tr("goal"),
//                                                          style: TextStyle(
//                                                              color:
//                                                              Colors.white,
//                                                              fontWeight:
//                                                              FontWeight
//                                                                  .bold,
//                                                              fontSize: 18)),
//                                                    ),
//                                                    PositionedDirectional(
//                                                      end: 7,
//                                                      width: 28,
//                                                      height: 40,
//                                                      top: 5,
//                                                      child: Container(
//                                                        decoration: BoxDecoration(
//                                                            color: Colors.white
//                                                                .withOpacity(
//                                                                0.3),
//                                                            borderRadius: BorderRadius
//                                                                .only(
//                                                                topLeft: Radius
//                                                                    .circular(
//                                                                    15),
//                                                                bottomRight:
//                                                                Radius.circular(
//                                                                    15),
//                                                                topRight: Radius
//                                                                    .circular(
//                                                                    15),
//                                                                bottomLeft: Radius
//                                                                    .circular(
//                                                                    15))),
//                                                        height: 35,
//                                                        width: 30,
//                                                      ),
//                                                    ),
//                                                    Padding(
//                                                      padding:
//                                                      const EdgeInsets.all(
//                                                          8.0),
//                                                      child: Container(
//                                                        width: 150,
//                                                        height: 150,
//                                                        child: Padding(
//                                                          padding:
//                                                          const EdgeInsets
//                                                              .only(
//                                                              left: 8,
//                                                              right: 8,
//                                                              top: 35),
//                                                          child: Text(
//                                                            tr("text_goal"),
//                                                            style: TextStyle(
//                                                                fontSize: 13,
//                                                                color: Colors
//                                                                    .white,
//                                                                fontWeight:
//                                                                FontWeight
//                                                                    .bold),
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    PositionedDirectional(
//                                                      end: 8,
//                                                      width: 24,
//                                                      top: 10,
//                                                      child: Icon(
//                                                        Icons
//                                                            .call_made_outlined,
//                                                        color: Colors.white,
//                                                      ),
//                                                    )
//                                                  ],
//                                                ),
//                                              ),
//                                            ],
//                                            options: CarouselOptions(
//                                                height: 250,
//                                                enableInfiniteScroll: true,
//                                                initialPage: 0,
//                                                viewportFraction: 1,
//                                                reverse: false,
//                                                autoPlay: true,
//                                                autoPlayInterval:
//                                                const Duration(seconds: 3),
//                                                autoPlayAnimationDuration:
//                                                const Duration(seconds: 1),
//                                                autoPlayCurve:
//                                                Curves.fastOutSlowIn,
//                                                scrollDirection:
//                                                Axis.horizontal));
//                                      }),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                            Padding(
//                              padding: const EdgeInsets.all(20.0),
//                              child: Center(
//                                child: Text(
//                                  tr("Teaching_staff"),
//                                  style: TextStyle(
//                                      color: blueColor,
//                                      fontSize: 24,
//                                      fontWeight: FontWeight.bold),
//                                ),
//                              ),
//                            ),
//                            Padding(
//                              padding: const EdgeInsets.all(8.0),
//                              child: Container(
//                                height: 200,
//                                child: ListView.separated(
//                                  physics: const BouncingScrollPhysics(),
//                                  scrollDirection: Axis.horizontal,
//                                  separatorBuilder: (context, index) =>
//                                  const SizedBox(
//                                    width: 10,
//                                  ),
//                                  itemCount: HomeCubit.get(context).homeModel!.message!.length,
//                                  itemBuilder: (context, index) {
//                                    return BuildTeacharItem(
//                                      indexx: index,
//                                      model: HomeCubit.get(context).homeModel!.message![index],
//                                    ).onTap(
//                                          () {
//                                        myApplication().navigateTo(TeacherInformationForStudentsView(
//                                            HomeCubit.get(context).homeModel!.message![index].id
//                                        ), context);
//                                      },
//                                    );
//                                  },
//                                ),
//                              ),
//                            ),
//                            Container(
//                              height: 100,
//                              child: Row(
//                                children: [
//                                  Padding(
//                                    padding: const EdgeInsets.all(10.0),
//                                    child: Text(
//                                      tr("The_courses"),
//                                      style: TextStyle(
//                                          color: blueColor,
//                                          fontSize: 24,
//                                          fontWeight: FontWeight.bold),
//                                    ),
//                                  ),
//                                  Container(
//                                    height: 50,
//                                    width: 200,
//                                    child: SelectStudyYearNew(),
//                                  ),
//                                ],
//                              ),
//                            ),
//                            Padding(
//                              padding: const EdgeInsets.all(8.0),
//                              child: Container(
//                                height: 180,
//                                child: ListView.separated(
//                                  physics: const BouncingScrollPhysics(),
//                                  scrollDirection: Axis.horizontal,
//                                  separatorBuilder: (context, index) =>
//                                  const SizedBox(
//                                    width: 10,
//                                  ),
//                                  itemCount: HomeCubit.get(context).homeModel!.message!.length,
//                                  itemBuilder: (context, index) {
//                                    return BuildCategoriesItem(HomeCubit.get(context).homeModel!.message![index],index,context)
//                                        .onTap(() async {
//                                      showDialog<String>(
//                                        context: context,
//                                        builder: (BuildContext context) =>
//                                        const Center(
//                                          child: CircularProgressIndicator(
//                                            color: mainColor,
//                                          ),
//                                        ),
//                                      );
//                                      await HomeCubit.get(context).incCourseView(
//                                        courseId: HomeCubit.get(context)
//                                            .coursesList[index].courseId!,
//                                      );
//                                      if (!mounted) return;
//
//                                      Navigator.pushAndRemoveUntil(
//                                        context,
//                                        MaterialPageRoute(
//                                          builder: (BuildContext context) =>
//                                              TreeCourseContentView(
//                                                courseId: HomeCubit.get(context)
//                                                    .coursesList[index]
//                                                    .courseId!,
//                                                courseTitle: HomeCubit.get(context)
//                                                    .coursesList[index]
//                                                    .courseName!,
//                                              ),
//                                        ),
//                                        ModalRoute.withName(
//                                          RouteName.treeCourseContentView,
//                                        ),
//                                      );
//                                    });
//                                  },
//                                ),
//                              ),
//                            ),
//                          ],
//                        ),
//                      )
//                          : Padding(
//                        padding: const EdgeInsets.symmetric(horizontal: 40),
//                        child: HomeCubit.get(context).hiddenCoursesList.isEmpty
//                            ? noCoursesAvail()
//                            : ListView.builder(
//                          itemCount: HomeCubit.get(context).hiddenCoursesList.length,
//                          itemBuilder: (context, index) {
//                            return hiddenCourseCard(
//                              HomeCubit as HomeCubit,
//                              index,
//                            ).onTap(
//                                  () async {
//                                await HomeCubit.get(context).enrollStudentToCourse(
//                                  token: HomeCubit.get(context).token!,
//                                  courseId: HomeCubit.get(context)
//                                      .hiddenCoursesList[index].courseId!,
//                                );
//                                if (HomeCubit.get(context)
//                                    .enrollStudentToCourseState) {
//                                  if (!mounted) return;
//                                  Navigator.push(
//                                    context,
//                                    MaterialPageRoute(
//                                      builder: (context) =>
//                                          TreeCourseContentView(
//                                            courseId: HomeCubit.get(context)
//                                                .hiddenCoursesList[index]
//                                                .courseId!,
//                                            courseTitle: HomeCubit.get(context)
//                                                .hiddenCoursesList[index]
//                                                .courseName!,
//                                          ),
//                                    ),
//                                  );
//                                }
//                              },
//                            );
//                          },
//                        ),
//                      ),
//                    ),
//                  );
//                }
//              )
//         );
//   }
// }
//
// Widget BuildCategoriesItem(Message model, index,context) => Container(
//   child: Stack(
//     children: [
//       Image(
//           image: AssetImage(index % 2 == 0
//               ? "assets/images/course_bink.png"
//               : "assets/images/course_blue.png")),
//       Positioned(
//         left: 90,
//         top: 47,
//         child: Container(
//           height: 78,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 tr("mr_name"),
//                 style: const TextStyle(
//                     color: kohlyColor,
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 2,
//               ),
//               Text(
//                 tr("Teacher_specialization"),
//                 style: const TextStyle(
//                     color: kohlyColor,
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 2,
//               ),
//               Text(
//                 tr("first_secondary"),
//                 style: const TextStyle(
//                     color: kohlyColor,
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ],
//   ),
// );
// Widget BuildTeacharItem(
//     {indexx,required Message model}) =>
//     Stack(
//       children: [
//         Image(
//             image: AssetImage(indexx % 2 == 0
//                 ? "assets/images/imagee_bink.png"
//                 : "assets/images/imagee_blue.png")),
//         Positioned(
//           left: 100,
//           top: 20,
//           child: Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   model.firstname as String,
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   model.lastname as String,
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Positioned(
//           top: 70,
//           left: 50,
//           child: Center(
//             child: CircleAvatar(
//               backgroundColor: whiteColor,
//               radius: 50,
//               child: Container(
//                 child: Card(
//                   elevation: 10,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(60),
//                   ),
//                   child: SizedBox(
//                     height: 120,
//                     width: 120,
//                     child: Image(
//                       image: AssetImage(
//                         "assets/images/marwaaa.png",
//                       ),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//
// Widget BuildAboutAcademyItem(index) => Container(
//   width: 120,
//   height: 160,
//   child: Stack(
//     children: [
//       Image(image: AssetImage("assets/images/blur_three.png")),
//       Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Text(tr("massage"),
//             style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18)),
//       ),
//       PositionedDirectional(
//         end: 2,
//         width: 28,
//         height: 40,
//         child: Container(
//           decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.3),
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(15),
//                   bottomRight: Radius.circular(15),
//                   topRight: Radius.circular(15),
//                   bottomLeft: Radius.circular(15))),
//           height: 35,
//           width: 30,
//         ),
//       ),
//       Container(
//         width: 150,
//         height: 120,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 8, right: 8, top: 44),
//           child: Text(
//             tr("text_test"),
//             style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//       PositionedDirectional(
//         end: 4,
//         width: 24,
//         top: 7,
//         child: Icon(
//           Icons.email_outlined,
//           color: Colors.white,
//         ),
//       )
//     ],
//   ),
// );
