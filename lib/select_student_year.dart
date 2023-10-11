import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eltafouk_ecademy/app/auth/view_model/auth_view_model.dart';
import 'package:eltafouk_ecademy/app/home/view_model/student_teacher_view_model.dart';
import 'package:eltafouk_ecademy/base_screen.dart';

import '../../../utils/colors.dart';

class SelectStudyYearNew extends StatefulWidget {
  AuthenticationViewModel authenticationViewModel = AuthenticationViewModel();

  @override
  State<SelectStudyYearNew> createState() => _SelectStudyYearState();
}

class _SelectStudyYearState extends State<SelectStudyYearNew> {
  @override
  Widget build(BuildContext context) {
    return BaseView<StudentTeacherHomeViewModel>(
      onModelReady: (viewModel) async {
        await viewModel.getUserToken();
        if (!mounted) return;
        viewModel.getCourse(context);
        viewModel.getTeatchersData(context);
        viewModel.getSchoolYearData(context);
      },
        builder: (context, viewModel, child){
          String? selected;
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              color: greylite,
            ),
            child: Center(
              child: DropdownButton<String>(
                hint: Text(viewModel.schoolYearsModel!.data![0].name as String),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  size: 30,
                  color: kohlyColor,
                ),
                isExpanded: true,
                underline: Container(),
                dropdownColor: Colors.white,
                items: viewModel.schoolYearsModel!.data!.map((item) {
                  return DropdownMenuItem<String>(
                      value: item.name.toString() ,
                      child: Text(
                          item.name as String ,
                          style: TextStyle(color: Colors.blueGrey, fontSize: 14,fontWeight: FontWeight.bold)));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selected = value.toString();
                  });
                },
                value: selected,
              ),
            ),
          ),
        );
        },
    );
  }

  checkSelectYear(context) {
    if (widget.authenticationViewModel.selected == tr('select_year')) {
      AuthenticationViewModel.studentYear = 0;
    } else if (widget.authenticationViewModel.selected ==
        tr('first_secondary')) {
      AuthenticationViewModel.studentYear = 10;
    } else if (widget.authenticationViewModel.selected ==
        tr('second_secondary')) {
      AuthenticationViewModel.studentYear = 11;
    } else if (widget.authenticationViewModel.selected ==
        tr('third_secondary')) {
      AuthenticationViewModel.studentYear = 12;
    }
  }
}
