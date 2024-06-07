import 'package:get/get.dart';
import 'package:mytasks/generated/assets.gen.dart';
import 'package:mytasks/generated/locales.g.dart';
import 'package:mytasks/src/configs/colors.dart';
import 'package:mytasks/src/configs/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytasks/src/data/models/tasksmodels/tasksresponse/task_model.dart';
import 'package:mytasks/src/ui/screens/tasksscreens/taskhistoryscreen/task_history_controller.dart';
import 'package:mytasks/src/ui/widgets/appbars/app_bar_default.dart';
import 'package:mytasks/src/ui/widgets/appbars/app_bar_projects.dart';
import 'package:mytasks/src/ui/widgets/buttons/button_default.dart';
import 'package:mytasks/src/ui/widgets/common/default_textfield_widget.dart';
import 'package:mytasks/src/ui/widgets/common/extentions.dart';
import 'package:mytasks/src/ui/widgets/common/getx_state_widget.dart';
import 'package:mytasks/src/ui/widgets/items/item_comment.dart';
import 'package:mytasks/src/ui/widgets/items/item_task_history.dart';
import 'package:mytasks/src/utils/basic_tools.dart';
import 'package:shimmer/shimmer.dart';

class TaskHistoryScreen extends GetWidget<TaskHistoryController> {
  static const String route = "/TaskHistoryScreen";

  TaskHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBarDefault(
          title: LocaleKeys.task_history.tr,
        ),
        body: Column(
          children: [
            Expanded(
                child: Container(
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
                        SizedBox(
                          height: 16.h,
                        ),
                        buildTaskHistoryWidget(controller.taskHistoryList),
                        SizedBox(
                          height: 48.h,
                        ),
                      ],
                    )),
              ),
            )),
          ],
        ),
        bottomNavigationBar: buildButtonClearHistory(),
      ),
    );
  }

  Widget buildTaskHistoryWidget(RxList<TaskModel> data) {
    return Obx(() {
      return data.isEmpty ?? true
          ? Container(
              height: Get.width,
              child: Container(
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50.w, color: Color(0x99E6E6E6)),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Center(
                    child: Text(LocaleKeys.no_task_history.tr),
                  )))
          : ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ItemTaskHistory(
                  task: data[index],
                  onClick: (task) {},
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  height: 10.h,
                );
              },
              itemCount: data.length ?? 0);
      ;
    });
  }

  Widget buildLoadingCommentsWidget() {
    return Shimmer.fromColors(
      baseColor: Get.isDarkMode ? Colors.white12 : Colors.grey[300]!,
      highlightColor:
          Get.isDarkMode ? Colors.white12.withOpacity(0.5) : Colors.grey[100]!,
      child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ItemCommentShimmer();
          },
          separatorBuilder: (context, index) {
            return Container(
              height: 10.h,
            );
          },
          itemCount: 4),
    );
  }

  buildButtonClearHistory() {
    return ButtonDefault(
      title: LocaleKeys.clear_history.tr,
    ).onClickBounce((){
      controller.clearTaskHistory();
    });
  }
}
