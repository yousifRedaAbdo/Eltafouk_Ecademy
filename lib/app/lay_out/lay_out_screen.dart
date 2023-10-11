import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eltafouk_ecademy/app/home_drawer/view/home_drawer.dart';
import 'package:eltafouk_ecademy/app/lay_out/cubit.dart';
import 'package:eltafouk_ecademy/app/lay_out/states.dart';
import 'package:eltafouk_ecademy/utils/colors.dart';


class LayOutScreen extends StatelessWidget {
  const LayOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create:(BuildContext context) => LayOutCubit(),
      child: BlocConsumer<LayOutCubit,LayOutStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = LayOutCubit.get(context);
          return Scaffold(
            drawer: HomeDrawerView(),
            appBar: AppBar(
              elevation: 0,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [kohlyColor, foshiaColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              actions: [
                Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Center(
                          child: Text(
                            tr("acadmi_name"),
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 2,
                          width: 130,
                          color: Colors.white,
                        )
                      ],
                    )),
                SizedBox(
                  width: 10,
                ),
                Image(
                  image: AssetImage("assets/images/logo_academy.png"),
                  height: 50,
                  width: 50,
                ),
                SizedBox(
                  width: 10,
                ),
              ],
              title: IconButton(
                  onPressed: () {
                    if (context.locale.languageCode == "en") {
                      context.setLocale(Locale("ar"));
                    } else {
                      context.setLocale(Locale("en"));
                    }

                    ;
                  },
                  icon: Icon(Icons.language),
                  color: whiteColor),
              centerTitle: false,
            ),
            body: cubit.bottomScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor:  foshiaColor,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              elevation: 2,

              onTap: (index){
                cubit.ChangeBottom(index);
              },
              currentIndex: cubit.currentIndex,
              items: [
                BottomNavigationBarItem(icon: Image(color: cubit.currentIndex == 0 ? Colors.blue.shade900: Colors.grey ,image: AssetImage("assets/images/home.png")),label: tr("home_"),),
                BottomNavigationBarItem(icon: Image(color: cubit.currentIndex == 1  ? Colors.blue.shade900: Colors.grey ,image: AssetImage("assets/images/profile.png")),label:  tr("profile_")),
                BottomNavigationBarItem(icon: Image(color: cubit.currentIndex == 2 ? Colors.blue.shade900: Colors.grey ,image: AssetImage("assets/images/groups.png")),label: tr("groups_")),
                BottomNavigationBarItem(icon: Image(color: cubit.currentIndex == 3 ? Colors.blue.shade900: Colors.grey ,image: AssetImage("assets/images/videoes.png")),label:  tr("videoes")),
                BottomNavigationBarItem(icon: Image(color: cubit.currentIndex == 4 ? Colors.blue.shade900: Colors.grey ,image: AssetImage("assets/images/notification.png")),label: tr("notification_")),
              ],
            ),
          );
        },
      ),
    );
  }
}
