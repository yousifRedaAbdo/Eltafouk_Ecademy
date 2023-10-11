import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eltafouk_ecademy/MyApplication.dart';
import 'package:eltafouk_ecademy/app/auth/view/log_in_view.dart';
import 'package:eltafouk_ecademy/app/home/view/student_teacher_home.dart';
import 'package:eltafouk_ecademy/select_student_year.dart';
import 'package:eltafouk_ecademy/utils/colors.dart';
import 'package:eltafouk_ecademy/utils/extensions.dart';

class HomeVistor extends StatelessWidget {
  const HomeVistor({Key? key}) : super(key: key);

  get viewModel => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
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
                    child: Text(tr("acadmi_name"),
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height:15,
                  ),
                  Container(
                    height: 2,
                    width: 130,
                    color: Colors.white,
                  )
                ],
              )
          ),
          SizedBox(
            width: 10,
          ),
          Image(
            image: AssetImage(
                "assets/images/logo_academy.png"
            ),
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
            icon: Icon(Icons.language),color: whiteColor),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [kohlyColor, foshiaColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(tr("About_the_Academy"),style: TextStyle(
                            color:Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 170,
                      child: Builder(
                          builder: (context) {
                            print(context.locale.languageCode);
                            return CarouselSlider(
                                items: [
                                  Builder(
                                      builder: (context) {
                                        print(context.locale.languageCode+"gg");
                                        return Container(
                                          width: 180,
                                          height:160,
                                          child: Stack(
                                            children: [
                                              Image(image: AssetImage(
                                                  "assets/images/blur.png"
                                              )
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(12.0),
                                                child: Text(tr("massage"),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
                                              ),
                                              PositionedDirectional(
                                                end: 7,
                                                width: 28,
                                                height: 40,
                                                top: 5,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color:Colors.white.withOpacity(0.3),
                                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight:Radius.circular(15),topRight: Radius.circular(15),bottomLeft: Radius.circular(15) )
                                                  ),
                                                  height: 35,
                                                  width: 30,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Container(
                                                  width: 150,
                                                  height: 150,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 8,right: 8,top: 44),
                                                    child: Text(
                                                      tr("text_massage"),
                                                      style: TextStyle(fontSize: 13,color: Colors.white,fontWeight: FontWeight.bold),

                                                    ),
                                                  ),
                                                ),
                                              ),
                                              PositionedDirectional(
                                                end: 8,
                                                width: 24,
                                                top: 10,
                                                child: Icon(
                                                  Icons.email_outlined,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }
                                  ),
                                  Container(
                                    width: 180,
                                    height:160,
                                    child: Stack(
                                      children: [
                                        Image(image: AssetImage(
                                            "assets/images/blur.png"
                                        )
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text(tr("vision"),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
                                        ),
                                        PositionedDirectional(
                                          end: 7,
                                          width: 28,
                                          height: 40,
                                          top: 5,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color:Colors.white.withOpacity(0.3),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight:Radius.circular(15),topRight: Radius.circular(15),bottomLeft: Radius.circular(15) )
                                            ),
                                            height: 35,
                                            width: 30,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 150,
                                            height: 150,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 8,right: 8,top: 44),
                                              child: Text(
                                                tr("text_vision"),
                                                style: TextStyle(fontSize: 13,color: Colors.white,fontWeight: FontWeight.bold),

                                              ),
                                            ),
                                          ),
                                        ),
                                        PositionedDirectional(
                                          end: 8,
                                          width: 24,
                                          top: 10,
                                          child: Icon(
                                            Icons.visibility_outlined,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 180,
                                    height:160,
                                    child: Stack(
                                      children: [
                                        Image(image: AssetImage(
                                            "assets/images/blur.png"
                                        )
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text(tr("goal"),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
                                        ),
                                        PositionedDirectional(
                                          end: 7,
                                          width: 28,
                                          height: 40,
                                          top: 5,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color:Colors.white.withOpacity(0.3),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight:Radius.circular(15),topRight: Radius.circular(15),bottomLeft: Radius.circular(15) )
                                            ),
                                            height: 35,
                                            width: 30,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 150,
                                            height: 150,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 8,right: 8,top: 35),
                                              child: Text(
                                                tr("text_goal"),
                                                style: TextStyle(fontSize: 13,color: Colors.white,fontWeight: FontWeight.bold),

                                              ),
                                            ),
                                          ),
                                        ),
                                        PositionedDirectional(
                                          end: 8,
                                          width: 24,
                                          top: 10,
                                          child: Icon(
                                            Icons.call_made_outlined,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                                options: CarouselOptions(
                                    height: 250,
                                    enableInfiniteScroll: true,
                                    initialPage: 0,
                                    viewportFraction: 1,
                                    reverse: false,
                                    autoPlay: true,
                                    autoPlayInterval: const Duration(seconds: 3),
                                    autoPlayAnimationDuration: const Duration(seconds: 1),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    scrollDirection: Axis.horizontal)
                            );
                          }
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(tr("Teaching_staff"),style: TextStyle(color:blueColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context,index)=>const SizedBox(width: 10,),
                  itemCount: 10,
                  itemBuilder: (context,index) {
                    return BuildTeacharItemNew(index)
                        .onTap(
                            () {
                            myApplication().navigateTo(LogInView(), context);
                          }
                    );
                  },
                ),
              ),
            ),
            Container(
              height: 100,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(tr("The_courses"),style: TextStyle(color:blueColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 200,
                    child: SelectStudyYearNew(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 180,
                // child: ListView.separated(
                //   physics: const BouncingScrollPhysics(),
                //   scrollDirection: Axis.horizontal,
                //   separatorBuilder: (context,index)=>const SizedBox(width: 10,),
                //   itemCount: 10,
                //   itemBuilder: (context,index) {
                //     return BuildCategoriesItem(index: index,model: VI)
                //         .onTap(
                //             () async {
                //             myApplication().navigateTo(LogInView(), context);
                //         }
                //     );
                //   },
                // ),
              ),
            ),
          ],
        ),
      )

    );
  }
}
Widget BuildTeacharItemNew(index) =>
    Stack(
      children: [
        Image(
            image: AssetImage(
                index % 2 == 0 ? "assets/images/imagee_bink.png":"assets/images/imagee_blue.png"
            )
        ),
        Positioned(
          left:100,
          top: 20,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr("mr_name"),
                  style: const TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  tr("Teacher_specialization"),
                  style: const TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 70,
          left: 50,
          child: Center(
            child: CircleAvatar(
              backgroundColor: whiteColor,
              radius: 50,
              child: Container(
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child:Image(
                      image: AssetImage(
                        "assets/images/marwaaa.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
