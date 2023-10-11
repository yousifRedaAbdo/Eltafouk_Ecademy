import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eltafouk_ecademy/app/home/view/model.dart';
import 'package:eltafouk_ecademy/app/home/view/teacher_profile_model.dart';
import 'package:eltafouk_ecademy/base_view_model.dart';
import 'package:eltafouk_ecademy/enums/screen_state.dart';
import 'package:eltafouk_ecademy/locator.dart';
import 'package:eltafouk_ecademy/services/api_service.dart';
import 'package:eltafouk_ecademy/services/navigation_service.dart';
import 'package:eltafouk_ecademy/services/shared_pref_services.dart';
import 'package:eltafouk_ecademy/utils/strings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:eltafouk_ecademy/app/home/view/dio.dart';

import '../../../comman_widgets/snak_bars.dart';
import '../../teacher_profile/model/teacher_data_model.dart';

class TeacherInformationForStudentsViewModel extends BaseViewModel {
  var apiServices = locator<ApiService>();
  var navigation = locator<NavigationService>();
  var pref = locator<SharedPrefServices>();
  final rateFormKey = GlobalKey<FormState>();
  TextEditingController feedBackController = TextEditingController();
  String token = '';
  String email = '';
  String firstName = '';
  String lastName = '';
  String centerName = '';
  String userImage = '';
  String bio = '';

  double rate = 0;
  bool dataState = false;
  List<Photos> photosList = [];
  List<Feedbacks> feedbacksList = [];
  List<Courses> coursesList = [];
  List<Videos> videosList = [];

  HomeModel? homeModel;
  void getTeatchersData(context) {

    dioHelper
        .getdata(
      url: 'academy/academyApi/json.php?function=teachers',
    )
        .then((value) {
      homeModel = HomeModel.fromJson(value.data);
      setState(ViewState.Idle);
    }).catchError((error) {
      print(error.toString());
      setState(ViewState.Busy);
    });
  }

  ProfileTeacherModel? profileTeacherModel;
  void getTeatchersDataImage(context,String teacherId) {
    dioHelper
        .getdata(
      url: 'kamalAhmed/academyApi/json.php?function=get_teacher_image&id=$teacherId',
    )
        .then((value) {
      profileTeacherModel = ProfileTeacherModel.fromJson(value.data);
      setState(ViewState.Idle);
    }).catchError((error) {
      print(error.toString());
      setState(ViewState.Busy);
    });
  }

  getToken() async {
    token = await pref.getString(userToken);
  }

  Future<void> launchTeacherUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch ';
    }
  }

  launchWhatsApp({
    required String mobileNumber,
  }) async {
    final link = WhatsAppUnilink(
      phoneNumber: '002$mobileNumber',
    );
    await launch('$link');
  }

  getTeacherData(context, token,teacherId) async {
    var data = await apiServices.getTeacherData(token: token,teacherId: teacherId);
    if (data == 'fail') {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: tr('process_fail'),
        desc: tr('unKnown_wrong'),
        btnCancelOnPress: () {},
      ).show();
    } else {
      TeacherDataModel teacherDataModel = TeacherDataModel.fromJson(data);
      bio = teacherDataModel.teacher.bio;
      rate = double.parse(teacherDataModel.teacher.rating);
      for (var i in teacherDataModel.teacher.courses) {
        coursesList.add(i);
      }
      for (var i in teacherDataModel.teacher.photos) {
        photosList.add(i);
      }
      for (var i in teacherDataModel.teacher.feedbacks) {
        feedbacksList.add(i);
      }
      for (var i in teacherDataModel.teacher.feedbacks) {
        feedbacksList.add(i);
      }
      for (var i in teacherDataModel.teacher.videos) {
        videosList.add(i);
      }
      dataState = true;
      setState(ViewState.Idle);
    }
  }

  FormFieldValidator<String>? feedBackValidator() {
    FormFieldValidator<String>? validator = (value) {
      if (value == null || value.isEmpty) {
        return tr('empty_feed_back');
      }
      return null;
    };
    return validator;
  }

  addFeedBackForOneCourse(
    context, {
    required String token,
    required String feedBackMessage,
    required String courseId,
  }) async {
    if (rateFormKey.currentState!.validate()) {
      var data = await apiServices.addFeedBackForOneCourse(
        token: token,
        feedBackMessage: feedBackMessage,
        courseId: courseId,
      );
      if (data == 'fail') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.SCALE,
          title: tr('process_fail'),
          desc: tr('unKnown_wrong'),
        ).show();
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.BOTTOMSLIDE,
          title: tr('successful_process'),
          desc: tr('feed_back_add'),
          btnOkOnPress: () {
            setState(ViewState.Idle);
          },
        ).show();
      }
    }
  }

  addRating({
    required BuildContext context,
    required String token,
    required String rating,
  }) async {
    var data = await apiServices.addRating(
      token: token,
      rating: rating,
    );
    if (data == 'fail') {
      ScaffoldMessenger.of(context).showSnackBar(unKnownErrorSnackBar);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(rateSnackBar);
    }
  }
}
