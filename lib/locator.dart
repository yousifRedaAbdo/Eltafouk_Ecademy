import 'package:get_it/get_it.dart';
import 'package:eltafouk_ecademy/app/access_to_course/view_model/access_to_course_view_model.dart';
import 'package:eltafouk_ecademy/app/auth/view_model/auth_view_model.dart';
import 'package:eltafouk_ecademy/app/change_password/view_model/change_password_view_model.dart';
import 'package:eltafouk_ecademy/app/codes_info/view_model/codes_information_view_model.dart';
import 'package:eltafouk_ecademy/app/contact_us/view_model/contact_us_view_model.dart';
import 'package:eltafouk_ecademy/app/edit_profile/view_model/edit_profile_view_model.dart';
import 'package:eltafouk_ecademy/app/edit_profile_from_teacher/view_model/edit_profile_view_from_teacher_view_model.dart';
import 'package:eltafouk_ecademy/app/home/view_model/student_teacher_view_model.dart';
import 'package:eltafouk_ecademy/app/reports/home_work_videos_report/view_model/home_work_videos_report_view_model.dart';
import 'package:eltafouk_ecademy/app/reports/pdf_report/view_model/pdf_report_view_model.dart';
import 'package:eltafouk_ecademy/app/reports/summary_reports/view_model/summary_report_view_model.dart';
import 'package:eltafouk_ecademy/app/splash/view_model/splash_view_model.dart';
import 'package:eltafouk_ecademy/app/teacher_information_for_students/view_model/teacher_information_for_students_view_model.dart';

import 'package:eltafouk_ecademy/app/teacher_profile/view_model/teacher_profile_view_model.dart';

import 'package:eltafouk_ecademy/services/shared_pref_services.dart';
import 'package:eltafouk_ecademy/app/single_student_report/view_model/single_student_report_view_model.dart';

import 'app/child_courses_for_parent/view_model/child_courses_for_parent_view_model.dart';
import 'app/course_content/view_model/course_content_view_model.dart';
import 'app/course_content/view_model/tree_course_content_view_model.dart';
import 'app/course_content_drawer/view_model/course_content_drawer_view_model.dart';
import 'app/course_members/view_model/course_member_view_model.dart';
import 'app/forum/view_model/forum_view_model.dart';
import 'app/home_drawer/view_model/home_drawer_view_model.dart';
import 'app/parent_edit_profile/view_model/parent_edit_profile_view_model.dart';
import 'app/parent_home/view_model/parent_home_view_model.dart';
import 'app/profile_page/view_model/profile_page_view_model.dart';
import 'app/reports/assignment_report/view_model/assignment_report_view_model.dart';
import 'app/reports/lessons_reports/view_model/lessons_report_view_model.dart';
import 'app/reports/quiz_report/view_model/quiz_without_feedback_detail_report_view_model.dart';
import 'app/reports/quiz_report/view_model/quiz_without_feedback_report_view_model.dart';
import 'app/reports/quiz_video_reports/view_model/quiz_video_report_view_model.dart';
import 'app/reports/quizzes_report/view_model/quizes_reports_view_model.dart';
import 'app/reports/reports/view_model/reports_view_model.dart';
import 'app/reports/revision_reports/view_model/revision_report_view_model.dart';
import 'app/reset_password/view_model/reset_password_view_model.dart';
import 'app/select_app_lang/view_model/select_app_lang_view_model.dart';
import 'app/teacher_profile/view_model/teacher_profile_view_model.dart';
import 'app/web_view/view_model/web_view_view_model.dart';
import 'services/api_service.dart';
import 'services/current_session service.dart';
import 'services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => CurrentSessionService());
  locator.registerLazySingleton(() => SharedPrefServices());
  initSingleton();
  locator.registerFactory(() => SplashViewModel());
  locator.registerFactory(() => AuthenticationViewModel());
  locator.registerFactory(() => ResetPasswordViewModel());
  locator.registerFactory(() => ParentHomeViewModel());
  locator.registerFactory(() => AppWebViewViewModel());
  locator.registerFactory(() => HomeDrawerViewModel());
  locator.registerFactory(() => SingleStudentReportViewModel());
  locator.registerFactory(() => ParentEditProfileViewModel());
  locator.registerFactory(() => ChildCoursesForParentViewModel());
  locator.registerFactory(() => ProfilePageViewModel());
  locator.registerFactory(() => StudentTeacherHomeViewModel());
  locator.registerFactory(() => CourseContentViewModel());
  locator.registerFactory(() => CourseContentDrawerViewModel());
  locator.registerFactory(() => ForumViewModel());
  locator.registerFactory(() => CourseMembersViewModel());
  locator.registerFactory(() => QuizVideoReportViewModel());
  locator.registerFactory(() => LessonsReportsViewModel());
  locator.registerFactory(() => ReportsViewModel());
  locator.registerFactory(() => QuizesReportsViewModel());
  locator.registerFactory(() => TeacherProfileViewModel());
  locator.registerFactory(() => ChangePasswordViewModel());
  locator.registerFactory(() => EditProfileViewModel());
  locator.registerFactory(() => TeacherInformationForStudentsViewModel());
  locator.registerFactory(() => ContactUsViewModel());
  locator.registerFactory(() => HomeWorkVideoReportDetailsViewModel());
  locator.registerFactory(() => SummaryReportsViewModel());
  locator.registerFactory(() => SelectAppLangViewModel());
  locator.registerFactory(() => TreeCourseContentViewModel());
  locator.registerFactory(() => QuizReportViewModel());
  locator.registerFactory(() => QuizWithoutFeedbackReportViewModel());
  locator.registerFactory(() => RevisionReportViewModel());
  locator.registerFactory(() => AssignmentReportViewModel());
  locator.registerFactory(() => PdfReportViewModel());
  locator.registerFactory(() => AccessToCourseReportViewModel());
  locator.registerFactory(() => CodesInformationViewModel());
  locator.registerFactory(() => EditStudentProfileViewModel());
}

void initSingleton() {
  locator<ApiService>();
  locator<NavigationService>();
  locator<CurrentSessionService>();
  locator<SharedPrefServices>();
}
