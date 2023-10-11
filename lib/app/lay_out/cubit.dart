import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eltafouk_ecademy/app/home/view/student_teacher_home.dart';
import 'package:eltafouk_ecademy/app/home/view/test.dart';
import 'package:eltafouk_ecademy/app/lay_out/states.dart';
import 'package:eltafouk_ecademy/app/profile_page/view/student_profile_page_view.dart';

class LayOutCubit extends Cubit<LayOutStates> {
  LayOutCubit() : super(LayOutInisialState());

  static LayOutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> bottomScreens =
  [
    StudentTeacherHomeView(),
    StudentProfileView(),
    StudentProfileView(),
    StudentProfileView(),
    StudentProfileView()
  ];

  void ChangeBottom(int index) {
    currentIndex = index;
    emit(LayOutChangeBottomNavState());
  }

}