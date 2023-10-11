import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:eltafouk_ecademy/app/teacher_information_for_students/view/add_feedback_view.dart';
import 'package:eltafouk_ecademy/app/teacher_information_for_students/view_model/teacher_information_for_students_view_model.dart';
import 'package:eltafouk_ecademy/base_screen.dart';
import 'package:eltafouk_ecademy/utils/colors.dart';
import 'package:eltafouk_ecademy/utils/spaces.dart';
import 'package:eltafouk_ecademy/utils/strings.dart';
import 'package:eltafouk_ecademy/utils/texts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TeacherInformationForStudentsView extends StatefulWidget {
  String courseId;
  int index;

  TeacherInformationForStudentsView(this.courseId,this.index);

  @override
  State<TeacherInformationForStudentsView> createState() =>
      _TeacherInformationForStudentsViewState();
}

class _TeacherInformationForStudentsViewState
    extends State<TeacherInformationForStudentsView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<TeacherInformationForStudentsViewModel>(
      onModelReady: (viewModel) async {
        viewModel.getTeatchersDataImage(context,widget.courseId);
        await viewModel.getToken();
        if (!mounted) return;
        await viewModel.getTeacherData(context, viewModel.token, widget.courseId);
      },
      builder: (context, viewModel, child) {
        return ConditionalBuilder(
          condition: viewModel.profileTeacherModel != null,
          builder:(context) => Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [kohlyColor, foshiaColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              bottom: false,
              right: false,
              left: false,
              top: true,
              child: Scaffold(
                backgroundColor: backgroundColor,
                appBar: AppBar(
                  centerTitle: true,
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
                  title: appBarTitle(
                    viewModel.profileTeacherModel!.fullname as String,
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      heightSpace(20),
                      Stack(
                        children: [
                          Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: SizedBox(
                              height: 120,
                              width: 120,
                              child: CircleAvatar(
                                backgroundColor: mainColor,
                                radius: 70,
                                child: ClipOval(
                                  child: Image.network(
                                    viewModel.profileTeacherModel!.image as String,
                                    width: 135,
                                    height: 135,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      heightSpace(10),
                      title(  viewModel.profileTeacherModel!.fullname as String,),
                      heightSpace(20),
                      RatingBar.builder(
                        initialRating: viewModel.rate,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (double value) {
                          viewModel.addRating(
                            token: viewModel.token,
                            rating: value.toString(),
                            context: context,
                          );
                        },
                      ),
                      heightSpace(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              viewModel.launchWhatsApp(
                                mobileNumber: teacherContactNumber,
                              );
                            },
                            icon: Image.asset(
                              'assets/images/whats_app.png',
                              height: 120,
                              width: 120,
                              fit: BoxFit.fill,
                            ),
                          ),
                          widthSpace(20),
                          IconButton(
                            onPressed: () {
                              viewModel.launchTeacherUrl(
                                  Uri.parse(teacherFaceBookLink));
                            },
                            icon: Image.asset(
                              'assets/images/fb.png',
                              height: 120,
                              width: 120,
                              fit: BoxFit.fill,
                            ),
                          ),
                          widthSpace(20),
                          IconButton(
                            onPressed: () {
                              viewModel.launchTeacherUrl(
                                  Uri.parse(teacherYoutubeLink));
                            },
                            icon: Image.asset(
                              'assets/images/youtube.png',
                              height: 120,
                              width: 120,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                      viewModel.bio == ''
                          ? Container()
                          : Column(
                        children: [
                          Row(),
                          heightSpace(20),
                          titleWidget(tr('bio')),
                          heightSpace(20),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0),
                            child: mediumText(viewModel.bio),
                          )
                        ],
                      ),
                      heightSpace(20),
                      titleWidget(tr('courses')),
                      viewModel.dataState == false
                          ? const Center(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: CircularProgressIndicator(
                            color: mainColor,
                          ),
                        ),
                      )
                          : SizedBox(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: viewModel.coursesList.map((e) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: SizedBox(
                                  width: 250,
                                  child: Card(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          '${e.overviewfiles[0].fileurl}?token=${viewModel.token}',
                                          height: 180,
                                          width: 250,
                                          fit: BoxFit.fill,
                                        ),
                                        heightSpace(10),
                                        Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              title(e.fullname),
                                              heightSpace(10),
                                              mediumText(
                                                tr('mr_name'),
                                                color: mainColor,
                                              ),
                                              heightSpace(10),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      heightSpace(20),
                      titleWidget(tr('photos')),
                      viewModel.dataState == false
                          ? const Center(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: CircularProgressIndicator(
                            color: mainColor,
                          ),
                        ),
                      )
                          : viewModel.photosList.isEmpty
                          ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: mediumText(
                            tr('no_data'),
                          ),
                        ),
                      )
                          : CarouselSlider(
                        options: CarouselOptions(
                          height:
                          MediaQuery.of(context).size.height * 0.30,
                          enableInfiniteScroll: false,
                          aspectRatio: 16 / 9,
                          initialPage: 0,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 5),
                          autoPlayAnimationDuration:
                          const Duration(milliseconds: 1000),
                          autoPlayCurve: Curves.fastOutSlowIn,
                        ),
                        items: viewModel.photosList.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, right: 8.0),
                                child: Image.network(
                                  i.photos,
                                  fit: BoxFit.fill,
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      heightSpace(10),
                      titleWidget(tr('feedback')),
                      viewModel.dataState == false
                          ? const Center(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: CircularProgressIndicator(
                            color: mainColor,
                          ),
                        ),
                      )
                          : viewModel.feedbacksList.isEmpty
                          ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: mediumText(
                            tr('no_data'),
                          ),
                        ),
                      )
                          : CarouselSlider(
                        options: CarouselOptions(
                          height:
                          MediaQuery.of(context).size.height * 0.10,
                          enableInfiniteScroll: false,
                          aspectRatio: 16 / 9,
                          initialPage: 0,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 5),
                          autoPlayAnimationDuration:
                          const Duration(milliseconds: 1000),
                          autoPlayCurve: Curves.fastOutSlowIn,
                        ),
                        items: viewModel.feedbacksList.map(
                              (i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Padding(
                                  padding:
                                  const EdgeInsets.only(top: 8.0),
                                  child: mediumText(
                                    i.feedback,
                                  ),
                                );
                              },
                            );
                          },
                        ).toList(),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AddRateView(widget.courseId),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [kohlyColor, foshiaColor],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: mediumText(
                            tr('add_feed_back'),
                            color: whiteColor,
                          ),
                        ),
                      ),
                      heightSpace(25)
                    ],
                  ),
                ),
              ),
            ),
          ),
          fallback: (context) => Container(color: Colors.white,child: Center(child: CircularProgressIndicator())),
        );
      },
    );
  }
}

Widget titleWidget(String text) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [kohlyColor, foshiaColor],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    child: mediumText(text, color: whiteColor),
  );
}
