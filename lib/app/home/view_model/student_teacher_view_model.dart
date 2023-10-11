import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eltafouk_ecademy/app/auth/view/log_in_view.dart';
import 'package:eltafouk_ecademy/app/home/model/courses_by_category.dart';
import 'package:eltafouk_ecademy/app/home/model/my_courses_model.dart';
import 'package:eltafouk_ecademy/app/home/model/school_year_model.dart';
import 'package:eltafouk_ecademy/app/home/view/model.dart';
import 'package:eltafouk_ecademy/app/home/view/student_teacher_home.dart';
import 'package:eltafouk_ecademy/app/home/view/teacher_profile_model.dart';
import 'package:eltafouk_ecademy/app/profile_page/view/student_profile_page_view.dart';

// import 'package:flutter_app_version_checker/flutter_app_version_checker.dart';
import 'package:eltafouk_ecademy/enums/screen_state.dart';
import 'package:eltafouk_ecademy/locator.dart';
import 'package:eltafouk_ecademy/services/api_service.dart';
import 'package:eltafouk_ecademy/services/navigation_service.dart';
import 'package:eltafouk_ecademy/services/shared_pref_services.dart';
import 'package:eltafouk_ecademy/utils/strings.dart';

import '../../../base_view_model.dart';
import '../../../comman_widgets/snak_bars.dart';
import '../../course_details/model/course_details_model.dart';
import '../model/course_model.dart';
import '../model/hidden_courses_model.dart' as hidden;
import 'package:eltafouk_ecademy/app/home/view/dio.dart';

class StudentTeacherHomeViewModel extends BaseViewModel {
  var pref = locator<SharedPrefServices>();
  var api = locator<ApiService>();
  var navigation = locator<NavigationService>();
  bool reservation = true;
  bool enrollStudentToCourseState = false;

  static String? index = "3";
  String? selected;
  String? token;

  List<Course> coursesList = [];
  List<hidden.Data> hiddenCoursesList = [];
  List<Contents> contentsList = [];
  List<List<Modules>> modulesList = [];
  List<String> moduleIds = [];
  String courseForumUrl = '';

  getUserToken() async {
    setState(ViewState.Busy);
    token = await pref.getString(userToken);
  }

  MyCoursesModel? myCoursesModel;
  getMyCourses(context) async {
   await dioHelper
        .getdata(
      url: 'academy/academyApi/json.php?function=get_enrol_courses&token=$token',
    )
        .then((value) {
      myCoursesModel = MyCoursesModel.fromJson(value.data);
      setState(ViewState.Idle);
    }).catchError((error) {
      print(error.toString());
      setState(ViewState.Busy);
    });
  }

  CoursesByCatogeryModel? coursesByCatogeryModel;
   getCoursesByCategory(context,String? categoryId) {
    dioHelper
        .getdata(
      url: 'successacademy/academyApi/json.php?function=get_courses_by_category&categoryId=$categoryId',
    )
        .then((value) {
      coursesByCatogeryModel = CoursesByCatogeryModel.fromJson(value.data);
      setState(ViewState.Idle);
    }).catchError((error) {
      print(error.toString());
      setState(ViewState.Busy);
    });
  }

  SchoolYearsModel? schoolYearsModel;
  void getSchoolYearData(context) {

    dioHelper
        .getdata(
      url: 'successacademy/academyApi/json.php?function=get_all_categories',
    )
        .then((value) {
      schoolYearsModel = SchoolYearsModel.fromJson(value.data);
      setState(ViewState.Idle);
    }).catchError((error) {
      print(error.toString());
      setState(ViewState.Busy);
    });
  }

  HomeModel? homeModel;
  void getTeatchersData(context) {

    dioHelper
        .getdata(
      url: 'academygeneralapis/academyApi/json.php?function=getallteachers',
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


  /// get course data hidden
  getCourseDataHidden(context) async {
    var data =
        await api.getCourseHidden(token: token!, teacherId: teacherUniqueId);
    if (data == 'fail') {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.SCALE,
        title: tr('process_fail'),
        desc: tr('unKnown_wrong'),
        btnCancelOnPress: () {},
      ).show();
    } else {
      var x = hidden.HiddenCoursesModel.fromJson(data, token: token!);
      for (var i in x.data!) {
        hiddenCoursesList.add(i);
      }
      setState(ViewState.Idle);
    }
  }

  getCourse(
    context,
  ) async {
    var data = await api.getCourse(token: token!);
    if (data == 'fail') {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.SCALE,
        title: tr('process_fail'),
        desc: tr('unKnown_wrong'),
        btnCancelOnPress: () {},
      ).show();
    } else {
      if (data['status'] == 'fail') {
        reservation = false;
        await getCourseDataHidden(context);
        setState(ViewState.Idle);
      } else {
        for (var i in data['data']) {
          coursesList.add(Course.fromJson(i, token: token!));
        }
        setState(ViewState.Idle);
      }
      setState(ViewState.Idle);
    }
  }

  enrollStudentToCourse({
    required String token,
    required String courseId,
  }) async {
    enrollStudentToCourseState =
        await api.enrollStudentToCourse(token: token, courseId: courseId);
    setState(ViewState.Idle);
  }

  incCourseView({
    required String courseId,
  }) async {
    var data = await api.incCourseView(courseId: courseId);
    if (data == 'fail') {
      print('can not inc course view');
    }
    print(data);
  }

  addCourseRating({
    required BuildContext context,
    required String courseId,
    required String rate,
  }) async {
    var token = await pref.getString(userToken);
    var data = await api.addCourseRate(
      courseId: courseId,
      token: token,
      rate: rate,
    );
    if (data == 'fail') {
      ScaffoldMessenger.of(context).showSnackBar(unKnownErrorSnackBar);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(rateSnackBar);
    }
  }
}
