import 'package:flutter/material.dart';
import 'package:eltafouk_ecademy/app/course_members/view_model/course_member_view_model.dart';
import 'package:eltafouk_ecademy/utils/colors.dart';
import 'package:eltafouk_ecademy/utils/spaces.dart';

Widget courseMembersSearch(CourseMembersViewModel viewModel) {
  return StatefulBuilder(
    builder: (BuildContext context, setState) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [kohlyColor, foshiaColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 80,
                child: Center(
                  child: TextFormField(
                    controller: viewModel.searchController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: whiteColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      hintText: 'search by name or email or phone',
                      icon: Icon(Icons.search,color: whiteColor),
                      isDense: true,
                      isCollapsed: true,
                      contentPadding: const EdgeInsets.all(8.0),
                    ),
                    onChanged: (value) {
                      setState(() {
                        viewModel.searchList.isEmpty
                            ? viewModel.searchList =
                                viewModel.enrolledMembersList
                            : null;
                        viewModel.filter(value.toLowerCase());
                        print(value);
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
