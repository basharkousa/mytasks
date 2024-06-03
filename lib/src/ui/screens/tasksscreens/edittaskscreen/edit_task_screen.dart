import 'package:get/get.dart';
import 'package:mytasks/src/configs/colors.dart';
import 'package:mytasks/src/configs/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytasks/src/data/models/projectsmodels/projectsresponse/projects_response.dart';
import 'package:mytasks/src/ui/screens/projectsscreens/projectsscreen/projects_controller.dart';
import 'package:mytasks/src/ui/screens/tasksscreens/edittaskscreen/edit_task_controller.dart';
import 'package:mytasks/src/ui/widgets/appbars/app_bar_projects.dart';
import 'package:mytasks/src/ui/widgets/common/getx_state_widget.dart';
import 'package:mytasks/src/ui/widgets/items/item_project.dart';
import 'package:shimmer/shimmer.dart';

class EditTaskScreen extends GetWidget<EditTaskController> {
  static const String route = "/EditTaskScreen";

  EditTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBarProjects(
          title: "My Projects",
        ),
        body: Container(
          margin: EdgeInsetsDirectional.only(
              start: Dimens.mainMargin, end: Dimens.mainMargin),
          child: RefreshIndicator(
            onRefresh: controller.onRefresh,
            color: AppColors.lightAccent,
            child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(height: 16.h,),
                    GetXStateWidget(
                      snapshotLiveData: controller.projectsResponseLiveData,
                      loadingWidget: buildLoadingProjectsWidget(),
                      contentWidget: (data) {
                        return buildProjectsWidget(data);
                      },
                      onRetryClicked: (){
                        controller.getProjects();
                      },
                    ),
                    SizedBox(
                      height: 48.h,
                    ),
                  ],
                )),
          ),
        ),
        // bottomNavigationBar: buildUpdateButton(context),
      ),
    );
  }

  Widget buildProjectsWidget(ProjectsResponse data) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ItemProject(project: data.projects?[index],onClick: (project){
            controller.goToProjectDetailsScreen(project);
          },);
        },
        separatorBuilder: (context, index) {
          return Container(
            height: 10.h,
          );
        },
        itemCount: data.projects?.length ?? 0);
  }

  Widget buildLoadingProjectsWidget() {
    return Shimmer.fromColors(
      baseColor: Get.isDarkMode ? Colors.white12 : Colors.grey[300]!,
      highlightColor:
      Get.isDarkMode ? Colors.white12.withOpacity(0.5) : Colors.grey[100]!,
      child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ItemProjectShimmer();
          },
          separatorBuilder: (context, index) {
            return Container(
              height: 10.h,
            );
          },
          itemCount: 4),
    );

  }
}
