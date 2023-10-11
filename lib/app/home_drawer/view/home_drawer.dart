import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eltafouk_ecademy/app/teacher_profile/view/teacher_profile_view.dart';
import 'package:eltafouk_ecademy/enums/screen_state.dart';
import 'package:eltafouk_ecademy/routs/routs_names.dart';
import 'package:eltafouk_ecademy/utils/colors.dart';
import 'package:eltafouk_ecademy/utils/extensions.dart';
import 'package:eltafouk_ecademy/utils/spaces.dart';

import '../../../base_screen.dart';
import '../../../comman_widgets/drawer_card.dart';
import '../../../utils/texts.dart';
import '../../profile_page/view/student_profile_page_view.dart';
import '../view_model/home_drawer_view_model.dart';

class HomeDrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeDrawerViewModel>(
      onModelReady: (viewModel) {
        viewModel.getHomeDrawerData();
      },
      builder: (context, viewModel, child) {
        var deviceSize = MediaQuery.of(context).size;
        return viewModel.state == ViewState.Busy
            ? const Center(
                child: CircularProgressIndicator(
                  color: whiteColor,
                ),
              )
            : Drawer(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [kohlyColor, foshiaColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          heightSpace(25),
                          Row(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: viewModel.userImage,
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          CircularProgressIndicator(
                                    value: downloadProgress.progress,
                                    color: whiteColor,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              widthSpace(15),
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  mediumText(
                                    viewModel.firstName,
                                    color: whiteColor,
                                  ),
                                  heightSpace(5),
                                  SizedBox(
                                    width: 150,
                                    child: smallText(
                                      viewModel.email,
                                      color: whiteColor,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ).onTap(() {
                            viewModel.role == 'teacher'
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const TeacherProfileView(),
                                    ),
                                  )
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const StudentProfileView(),
                                    ),
                                  );
                          }),
                          heightSpace(25),
                          drawerCard(
                            text: tr('edit_profile'),
                          ).onTap(() {
                            viewModel.navigation.navigateTo(
                              RouteName.editProfileView,
                            );
                          }),
                          heightSpace(20),
                          drawerCard(
                            text: tr('change_pass'),
                          ).onTap(() {
                            viewModel.navigation
                                .navigateTo(RouteName.changePasswordView);
                          }),
                          heightSpace(20),
                          drawerCard(
                            text: tr('contact'),
                          ).onTap(() {
                            viewModel.navigation
                                .navigateTo(RouteName.contactUsView);
                          }),
                          heightSpace(20),
                          drawerCard(
                            text: tr('about'),
                          ).onTap(() {
                            viewModel.navigation
                                .navigateTo(RouteName.aboutUsView);
                          }),
                          heightSpace(20),
                          SwitchListTile(
                            activeColor: kohlyliteColor,
                            title: Text(tr("switch_language"),style: TextStyle(color: Colors.white)),
                            value: context.locale.languageCode == "en",
                            onChanged: (bool newValue) {
                             if (context.locale.languageCode == "en") {
                              context.setLocale(Locale("ar"));
                               } else {
                                 context.setLocale(Locale("en"));
                                };
                             },
                            secondary: Icon(Icons.language,color: Colors.white),
                          ),


                          heightSpace(deviceSize.height < 900
                              ? deviceSize.height * (25 / 100)
                              : deviceSize.height * (35 / 100)),
                          Container(
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)),
                            height: 55,
                            width: double.infinity,
                            child: Center(
                              child:
                                  title(tr('log_out'), color: blueColor),
                            ),
                          ).onTap(() {
                            viewModel.logOut();
                          })
                        ],
                      ),
                    ),
                  ),
                ));
      },
    );
  }
}
// Row(
// children: [
// Text("AR or EN",style: TextStyle(color: whiteColor)),
// IconButton(
// onPressed: () {
// if (context.locale.languageCode == "en") {
// context.setLocale(Locale("ar"));
// } else {
// context.setLocale(Locale("en"));
// }
// ;
// },
// icon: Icon(Icons.language),color: whiteColor),
// ],
// ),