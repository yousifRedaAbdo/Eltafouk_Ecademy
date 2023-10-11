import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eltafouk_ecademy/app/auth/view/sign_up_parent_view.dart';
import 'package:eltafouk_ecademy/app/auth/view/sign_up_student_view.dart';
import 'package:eltafouk_ecademy/utils/colors.dart';

import '../../../base_screen.dart';
import '../../../utils/texts.dart';
import '../view_model/auth_view_model.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthenticationViewModel>(
      onModelReady: (viewModel) {},
      builder: (context, viewModel, child) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: appBarTitle(tr('register')),
              centerTitle: true,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [kohlyColor, foshiaColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              elevation: 0,
              bottom: TabBar(
                labelColor: Colors.white,
                labelStyle:
                   TextStyle(
                    color: whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),


                unselectedLabelColor: Colors.blue,
                tabs: [
                  Tab(
                    text: tr('student'),
                  ),
                  Tab(
                    text: tr('parent'),
                  ),
                ],
                indicatorColor: Colors.white,
                indicatorWeight: 2.5,
              ),
            ),
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [kohlyColor, foshiaColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              height: double.infinity,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.only(top: 8.0, left: 12, right: 12),
                child: TabBarView(
                  children: <Widget>[
                    SignUpStudentView(),
                    SignUpParentView(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
