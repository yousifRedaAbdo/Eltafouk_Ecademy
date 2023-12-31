import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eltafouk_ecademy/base_screen.dart';
import 'package:eltafouk_ecademy/utils/colors.dart';
import 'package:eltafouk_ecademy/utils/spaces.dart';
import 'package:eltafouk_ecademy/utils/texts.dart';

import '../view_model/codes_information_view_model.dart';

class CodesInformation extends StatelessWidget {
  String courseId;

  CodesInformation(this.courseId);

  @override
  Widget build(BuildContext context) {
    return BaseView<CodesInformationViewModel>(
      onModelReady: (viewModel) async {
        viewModel.gatAllPatches(courseId: this.courseId);
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: appBarTitle(tr('code_info')),
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
          ),
          body: viewModel.isDataLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: mainColor,
                  ),
                )
              : viewModel.isError
                  ? Center(
                      child: title(tr('unKnown_wrong')),
                    )
                  : ListView.separated(
                      itemCount: viewModel.patches.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white ,
                                border: Border.all(
                                    color: foshiaColor
                                ),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: title(viewModel.patches[index].patchname!),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    heightSpace(10),
                                    mediumText(
                                        'Total : ${viewModel.patches[index].patchnumberofcodes![0].numberofcodes!}'),
                                    heightSpace(5),
                                    smallText(
                                        'Used : ${viewModel.patches[index].patchnumberofusedcodes![0].numberofusedcodes!}'),
                                    heightSpace(5),
                                    smallText(
                                        'Not used : ${viewModel.patches[index].patchnumberofnotusedcodes![0].numberofnotusedcodes!}'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          color: Colors.white,
                          thickness: 1,
                        );
                      },
                    ),
        );
      },
    );
  }
}
