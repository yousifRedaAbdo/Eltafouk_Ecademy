import 'dart:async';

import 'package:flutter/material.dart';
import 'package:eltafouk_ecademy/app/course_members/model/course_member_model.dart';
import 'package:eltafouk_ecademy/app/course_members/view_model/course_member_view_model.dart';
import 'package:eltafouk_ecademy/app/edit_profile_from_teacher/view/edit_profile_view_from_teacher.dart';
import 'package:eltafouk_ecademy/app/single_student_report/view/single_student_report_view.dart';
import 'package:eltafouk_ecademy/comman_widgets/inputField.dart';
import 'package:eltafouk_ecademy/enums/screen_state.dart';
import 'package:eltafouk_ecademy/utils/colors.dart';
import 'package:eltafouk_ecademy/utils/spaces.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

Widget courseMembersCard({
  required BuildContext context,
  required String id,
  required int index,
  required Groupmember member,
  required CourseMembersViewModel viewModel,
}) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: foshiaColor
          ),
            color: whiteColor,
            borderRadius: BorderRadius.circular(10)
        ),
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SingleStudentReportView(
                  member.fullName,
                  member.id,
                  id,
                ),
              ),
            );
          },
          leading: Container(
              child: Image.network(
                member.image,
                height: 100,
                width: 80,
                fit: BoxFit.fill,
              ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              courseMemberText(
                'Name : ${member.fullName}',
                index,
              ),
              courseMemberText(
                'Email : ${member.email}',
                index,
              ),
              courseMemberText(
                'Phone : ${member.phone}',
                index,
              ),
              courseMemberText(
                'Center : ${member.centerName}',
                index,
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              changePass(context, viewModel: viewModel, member: member);
            },
            child: Text('Set Password',style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
              backgroundColor: kohlyColor,
              foregroundColor: kohlyColor,
            ),
          ),
          widthSpace(20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditStudentProfileView(
                    member.token,
                  ),
                ),
              ).then((value) {
                viewModel.getData = false;
                viewModel.setState(ViewState.Busy);
                viewModel.getMembers(courseId: id);
              });
            },
            child: Text('Edit Profile',style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
              backgroundColor: kohlyColor,
              foregroundColor: kohlyColor,
            ),
          ),
        ],
      )
    ],
  );
}

Widget courseMemberText(text, index, {double size = 14}) {
  return Text(
    text,
    style: TextStyle(
      color: kohlyliteColor,
      fontSize: size,
      height: 1.5,
      fontWeight: FontWeight.bold
    ),
  );
}

Future<void> changePass(
  context, {
  required CourseMembersViewModel viewModel,
  required Groupmember member,
}) async {
  return showDialog<void>(
    context: context, barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Set new password'),
        content: Form(
          key: viewModel.changePassKey,
          child: SingleChildScrollView(
            child: ListBody(
              children: [
                InputField(
                  hint: 'new password',
                  inputType: TextInputType.text,
                  controller: viewModel.setPasswordController,
                  icon: Icons.password,
                  validator: viewModel.passwordValidator(),
                )
              ],
            ),
          ),
        ),
        actions: [
          RoundedLoadingButton(
            elevation: 0,
            width: 100,
            color: mainColor,
            successColor: successfulColor,
            errorColor: errorColor,
            height: 40,
            controller: viewModel.btnController,
            onPressed: () {
              viewModel
                  .setNewPassword(
                token: member.token,
                password: viewModel.setPasswordController.text,
              )
                  .then((value) {
                if (value) {
                  viewModel.btnController.success();
                  Timer(Duration(seconds: 2), () {
                    viewModel.setPasswordController.clear();
                    Navigator.pop(context);
                  });
                } else {
                  viewModel.btnController.error();
                  Timer(Duration(seconds: 2), () {
                    viewModel.setPasswordController.clear();
                    Navigator.pop(context);
                  });
                }

                print('======value $value');
              });
            },
            child: Text('set'),
          ),
        ],
      );
    },
  );
}
