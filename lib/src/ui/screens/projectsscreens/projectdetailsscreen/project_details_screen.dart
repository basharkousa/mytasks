import 'package:appflowy_board/appflowy_board.dart';
import 'package:get/get.dart';
import 'package:mytasks/generated/fonts.gen.dart';
import 'package:mytasks/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytasks/src/configs/app_theme.dart';
import 'package:mytasks/src/data/local/datasources/sharedpref/shared_preference_helper.dart';
import 'package:mytasks/src/data/models/sectionsmodels/sectionsresponse/sections_response.dart';
import 'package:mytasks/src/ui/screens/projectsscreens/projectdetailsscreen/project_details_controller.dart';
import 'package:mytasks/src/ui/widgets/appbars/app_bar_default.dart';
import 'package:mytasks/src/ui/widgets/common/extentions.dart';
import 'package:mytasks/src/ui/widgets/common/getx_state_widget.dart';
import 'package:mytasks/src/utils/basic_tools.dart';

class ProjectDetailsScreen extends GetWidget<ProjectDetailsController> {
  static const String route = "/ProjectDetailsScreen";

  ProjectDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBarDefault(
          title: "${controller.project.name}",
        ),
        body: Container(
          margin: EdgeInsetsDirectional.only(start: 4.w, end: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              // SizedBox(height: 16.h,),
              Expanded(
                child: Container(
                  // height: Get.height/2,
                  child: buildProjectSectionsWidgetState(),
                ),
              )
            ],
          ),
        ),
        // bottomNavigationBar: buildUpdateButton(context),
      ),
    );
  }

  buildProjectSectionsWidgetState() {
    return GetXStateWidget(
      snapshotLiveData: controller.sectionsResponseLiveData,
      contentWidget: (data) {
        return AppFlowyBoard(
          controller: controller.appFlowyController?? AppFlowyBoardController(),
          config: AppFlowyBoardConfig(
              boardCornerRadius: 10.r,
              groupCornerRadius: 16.r,
              groupBackgroundColor: AppTheme.getChosenColor(Get.find<SharedPreferenceHelper>().themeMode??"light"),
              groupBodyPadding: EdgeInsets.all(2.0.h),
              groupMargin: EdgeInsets.all(4.0.h),
              groupHeaderPadding: EdgeInsets.all(4.h)),
          headerBuilder: (context, group) {
            return buildHeaderWidget(context,group);
          },
          footerBuilder: (context, group) {
            return buildFooterWidget(context,group,data);
          },
          cardBuilder: (context, group, groupItem) {
            return buildTaskItemFlowy(context,group,groupItem);
          },
          groupConstraints: BoxConstraints.expand(width: Get.width * 0.46),
        );
      },
      onRetryClicked: () {
        controller.getSections();
      },
    );
  }

  buildHeaderWidget(BuildContext context, AppFlowyGroupData<dynamic> group) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Text(
          group.headerData.groupName,
          style: TextStyle(
              color: BasicTools.getSectionColor(group),
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  buildFooterWidget(BuildContext context, AppFlowyGroupData<dynamic> group, SectionsResponse? data) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Divider(
              color: Colors.black12,
            ),
            Row(
              children: [
                Icon(
                  Icons.add,
                  size: 16.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(LocaleKeys.add_new.tr)
              ],
            ),
            SizedBox(
              height: 16.h,
            )
          ],
        ),
      ),
    ).onClickBounce(() {
      controller.goToAddTaskScreen(group, data!);
    });
  }

  buildTaskItemFlowy(BuildContext context, AppFlowyGroupData<dynamic> group, AppFlowyGroupItem groupItem) {
    final taskItemFlowy = groupItem as TaskItemFlowy;
    return AppFlowyGroupCard(
      decoration: BoxDecoration(
          color: BasicTools.getSectionColor(group),
          borderRadius: BorderRadiusDirectional.all(Radius.circular(8.r))
      ),
      key: ObjectKey(taskItemFlowy),
      child: Container(
          width: Get.width / 2,
          padding: EdgeInsets.only(left: 4.w),
          decoration: ShapeDecoration(
            color: BasicTools.getSectionColor(group),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.w, color: Color(0x99E6E6E6)),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Container(
            decoration: ShapeDecoration(
              color: AppTheme.getChosenColor(Get.find<SharedPreferenceHelper>().themeMode??"light"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.r),
                    bottomRight: Radius.circular(8.r)),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        taskItemFlowy.taskModel.content ?? "content",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp),
                      ),
                    ),
                    // Expanded(child: Container()),
                    GetXStateWidget(
                      snapshotLiveData: taskItemFlowy.taskModel
                          .deleteTaskLiveData,
                      loadingWidget: Padding(
                        padding: EdgeInsets.all(4.0.w),
                        child: SizedBox(height: 10.w,
                          width: 10.w,
                          child: CircularProgressIndicator(
                            color: BasicTools.getSectionColor(group),
                            strokeWidth: 2.w,),),
                      ),
                      contentWidget: (data) {
                        return buildShowTaskOptionsWidget(
                            taskItemFlowy,group);
                      },
                      errorWidget: buildShowTaskOptionsWidget(
                          taskItemFlowy,group),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(taskItemFlowy.taskModel.description ?? "content"),
                SizedBox(
                  height: 8.h,
                ),
              ],
            ),
          )),
      // margin: EdgeInsets.all(4.w),
    );
  }


  void showPopupMenu(BuildContext context,
      Offset offset, TaskItemFlowy taskItemFlowy, AppFlowyGroupData<dynamic> group,) async {
    final screenSize = MediaQuery
        .of(context)
        .size;
    double left = offset.dx;
    double top = offset.dy;
    double bottom = screenSize.height - offset.dy;
    String? selectedItem = await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, 100.0, bottom),
      items: [
        popupMenuItem(
          icon: Icons.comment,
          title: LocaleKeys.comments.tr,
          color: Colors.brown,
          onTap: () {
            controller.goToCommentsScreen(taskItemFlowy,);
          },
        ),
        popupMenuItem(
          icon: Icons.edit,
          title: LocaleKeys.edit.tr,
          color: Colors.green,
          onTap: () {
            controller.goToEditTaskScreen(taskItemFlowy,);
          },
        ),
        popupMenuItem(
          color: Colors.red,
          icon: Icons.delete_outline,
          title: LocaleKeys.delete.tr,
          onTap: () {
            controller.deleteTask(taskItemFlowy,group);
          },
        ),
      ],
      // color: AppColors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0.r),
      ),
    );

    if (selectedItem != null) {
      // Perform the desired action based on the selected menu item
      print('Selected item: $selectedItem');
    }
  }
  popupMenuItem({void Function()? onTap,
    String title = '',
    IconData icon = Icons.insert_emoticon,
    Color? color = Colors.white,
    }) {
    return PopupMenuItem<String>(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      onTap: onTap,
      textStyle: TextStyle(
        color: Colors.white,
        fontFamily: FontFamily.montserrat,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 14.w,
            color: color ?? Colors.black,
          ),
          SizedBox(width: 4.w),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color ?? Color(0xFF737373),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
  buildShowTaskOptionsWidget(TaskItemFlowy taskItemFlowy, AppFlowyGroupData<dynamic> group) {
    return GestureDetector(
      onTapDown: (details) =>
          showPopupMenu(
              Get.context!, details.globalPosition, taskItemFlowy,group),
      child: Icon(
        Icons.keyboard_control_outlined,
        size: 18.w,
        // color: Colors.black38,
      ),
    );
  }

}
