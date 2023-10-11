import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eltafouk_ecademy/MyApplication.dart';
import 'package:eltafouk_ecademy/home_vistor.dart';
import 'package:eltafouk_ecademy/routs/routs_names.dart';
import 'package:eltafouk_ecademy/utils/extensions.dart';
import 'package:eltafouk_ecademy/utils/spaces.dart';
import 'package:eltafouk_ecademy/utils/texts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../base_screen.dart';
import '../../../comman_widgets/inputField.dart';
import '../../../comman_widgets/main_button.dart';
import '../../../utils/colors.dart';
import '../../../utils/strings.dart';
import '../view_model/auth_view_model.dart';
import '../widgets/contact_with_us.dart';

class LogInView extends StatelessWidget {
  const LogInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView<AuthenticationViewModel>(
      onModelReady: (viewModel) {
        viewModel.checkSignUp();
      },
      builder: (context, viewModel, child) {
        var deviceSize = MediaQuery.of(context).size;

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [kohlyColor, foshiaColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            bottom: false,
            right: false,
            left: false,
            top: true,
            child: Form(
              key: viewModel.logInFormKey,
              child: Scaffold(
                backgroundColor: foshiaColor.withOpacity(0.1),
                body: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [kohlyColor, foshiaColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Image(
                            image: AssetImage("assets/images/Group.png"),
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                heightSpace(50),
                                Center(
                                  child: Image.asset(
                                    'assets/images/logo_academy.png',
                                    width: 135,
                                    height: 135,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                heightSpace(20),
                                Center(child: appBarTitle(tr('acadmi_name'))),
                                heightSpace(20),
                                Text(tr('email'),style: TextStyle(fontSize: 20,color: whiteColor),),
                                heightSpace(10),
                                   InputField(
                                    inputType: TextInputType.emailAddress,
                                    controller: viewModel.email,
                                    validator: viewModel.emailValidator(),
                                    icon: Icons.email,
                                    hint: tr('email'),
                                  ),
                                heightSpace(20),
                                Text(tr('password'),style: TextStyle(fontSize: 20,color: whiteColor),),
                                heightSpace(10),
                                   InputField(
                                    inputType: TextInputType.text,
                                    controller: viewModel.password,
                                    icon: Icons.lock,
                                    validator: viewModel.passwordValidator(),
                                    isPassword: true,
                                    hint: tr('password'),
                                  ),
                                heightSpace(15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    smallBoldTitle(
                                      tr('forget_password'),
                                    )
                                  ],
                                ).onTap(() {
                                  viewModel.navigation
                                      .navigateTo(RouteName.resetPassword);
                                }),
                                heightSpace(35),
                                RoundedLoadingButton(
                                  elevation: 0,
                                  width: deviceSize.width,
                                  color: grey.withOpacity(.3),
                                  successColor: successfulColor,
                                  errorColor: errorColor,
                                  height: 50,
                                  controller: viewModel.btnController,
                                  onPressed: () {
                                    viewModel.login(context);
                                    },
                                  child: roundedButtonText(
                                    tr('log_in'),
                                  ),
                                ),
                                heightSpace(25),
                                viewModel.signUpState == true
                                    ? mainButton(tr('register')).onTap(() {
                                  viewModel.navigation
                                      .navigateTo(RouteName.signUp);
                                })
                                    : contactWithUs(
                                  context: context,
                                  techNumber: tecContactNumber,
                                  teacherNumber2: teacherContactNumber2,
                                  teacherNumber1: teacherContactNumber,
                                ),
                                heightSpace(25),
                                mainButton(
                                    tr('Login_as_a_visitor')
                                ).onTap((){
                                  myApplication().navigateTo(HomeVistor(), context);
                                }),
                                viewModel.signUpState == true
                                    ? heightSpace(80)
                                    : heightSpace(50),
                                smallText('All rights reserved to N.I.T © 2022'),
                                heightSpace(10),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      onFinish: (viewModel) {
        viewModel.email.dispose();
        viewModel.password.dispose();
      },
    );
  }
}
