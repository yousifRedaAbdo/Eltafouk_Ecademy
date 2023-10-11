// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:medhat_nabil/app/home/model/course_model.dart';
// import 'package:medhat_nabil/app/home/view/model.dart';
// import 'package:medhat_nabil/app/home/view/states.dart';
// import 'package:medhat_nabil/app/home/view/dio.dart';
// import 'package:medhat_nabil/locator.dart';
// import 'package:medhat_nabil/services/api_service.dart';
// import 'package:medhat_nabil/services/navigation_service.dart';
// import 'package:medhat_nabil/utils/strings.dart';
//
// import '../../../comman_widgets/snak_bars.dart';
// import '../../../services/shared_pref_services.dart';
// import '../../course_content/model/final_course_content_mobile_model.dart';
// import '../model/hidden_courses_model.dart' as hidden;
// class HomeCubit extends Cubit<HomeStates> {
//   HomeCubit() : super(HomeInisialState());
//
//   static HomeCubit get(context) => BlocProvider.of(context);
//
//   HomeModel? homeModel;
//   void getTeatchersData() {
//     emit(HomeLoadingHomeDataState());
//     dioHelper
//         .getdata(
//       url: 'academy/academyApi/json.php?function=teachers',
//     )
//         .then((value) {
//       homeModel = HomeModel.fromJson(value.data);
//       emit(HomeSuccessHomeDataState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(HomeErrorHomeDataState());
//     });
//   }
//
//   var pref = locator<SharedPrefServices>();
//   var api = locator<ApiService>();
//   var navigation = locator<NavigationService>();
//   bool reservation = true;
//   bool enrollStudentToCourseState = false;
//
//   String? token;
//
//   List<Course> coursesList = [];
//   List<hidden.Data> hiddenCoursesList = [];
//   List<Contents> contentsList = [];
//   List<List<Modules>> modulesList = [];
//   List<String> moduleIds = [];
//   String courseForumUrl = '';
//
//   getUserToken() async {
//     emit(GetUserTokenSuccessHomeDataState());
//     token = await pref.getString(userToken);
//   }
//
//   /// get course data hidden
//   getCourseDataHidden(context) async {
//     var data =
//     await api.getCourseHidden(token: token!, teacherId: teacherUniqueId);
//     if (data == 'fail') {
//       AwesomeDialog(
//         context: context,
//         dialogType: DialogType.ERROR,
//         animType: AnimType.SCALE,
//         title: tr('process_fail'),
//         desc: tr('unKnown_wrong'),
//         btnCancelOnPress: () {},
//       ).show();
//     } else {
//       var x = hidden.HiddenCoursesModel.fromJson(data, token: token!);
//       for (var i in x.data!) {
//         hiddenCoursesList.add(i);
//       }
//       emit(GetCourseSuccessHomeDataState());
//     }
//   }
//
//   getCourse(
//       context,
//       ) async {
//     var data = await api.getCourse(token: token!);
//     if (data == 'fail') {
//       AwesomeDialog(
//         context: context,
//         dialogType: DialogType.ERROR,
//         animType: AnimType.SCALE,
//         title: tr('process_fail'),
//         desc: tr('unKnown_wrong'),
//         btnCancelOnPress: () {},
//       ).show();
//     } else {
//       if (data['status'] == 'fail') {
//         reservation = false;
//         await getCourseDataHidden(context);
//         emit(GetCourseSuccessHomeDataState());
//       } else {
//         for (var i in data['data']) {
//           coursesList.add(Course.fromJson(i, token: token!));
//         }
//         emit(GetCourseSuccessHomeDataState());
//       }
//       emit(GetCourseSuccessHomeDataState());
//     }
//   }
//
//   enrollStudentToCourse({
//     required String token,
//     required String courseId,
//   }) async {
//     enrollStudentToCourseState =
//     await api.enrollStudentToCourse(token: token, courseId: courseId);
//    emit(EnrollStudentToCourseSuccessHomeDataState());
//   }
//
//   incCourseView({
//     required String courseId,
//   }) async {
//     var data = await api.incCourseView(courseId: courseId);
//     if (data == 'fail') {
//       print('can not inc course view');
//     }
//     print(data);
//   }
//
//   addCourseRating({
//     required BuildContext context,
//     required String courseId,
//     required String rate,
//   }) async {
//     var token = await pref.getString(userToken);
//     var data = await api.addCourseRate(
//       courseId: courseId,
//       token: token,
//       rate: rate,
//     );
//     if (data == 'fail') {
//       ScaffoldMessenger.of(context).showSnackBar(unKnownErrorSnackBar);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(rateSnackBar);
//     }
//   }
// }
//
//
