import 'package:flutter/material.dart';
import 'package:eltafouk_ecademy/app/access_to_course/generate_quiz_videos_pdf/generate_quiz_pdf.dart';
import 'package:eltafouk_ecademy/base_view_model.dart';
import 'package:eltafouk_ecademy/enums/screen_state.dart';
import 'package:eltafouk_ecademy/locator.dart';
import 'package:eltafouk_ecademy/services/api_service.dart';

import '../model/access_to_course_model.dart';

class AccessToCourseReportViewModel extends BaseViewModel {
  ApiService apiService = locator<ApiService>();
  GenerateAccessToCoursePDF generateAccessToCoursePDF =
      GenerateAccessToCoursePDF();
  List<Viewed> viewedList = [];
  List<NotViewed> notViewedList = [];

  GetAccessToCourse(
      {required BuildContext context, required String courseId}) async {
    var data = await apiService.accessToCourse(courseId: courseId);
    if (data == 'fail') {
    } else {
      AccessToCourseModel accessToCourseModel =
          AccessToCourseModel.fromJson(data);
      for (var i in accessToCourseModel.notViewed) {
        notViewedList.add(i);
      }
      for (var i in accessToCourseModel.viewed) {
        viewedList.add(i);
      }
      setState(ViewState.Idle);
    }
  }
}
